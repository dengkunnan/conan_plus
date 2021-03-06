package com.tal.wangxiao.conan.agent.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.tal.wangxiao.conan.agent.cache.CodeCache;
import com.tal.wangxiao.conan.agent.model.DiffMode;
import com.tal.wangxiao.conan.agent.service.AgentDiffService;
import com.tal.wangxiao.conan.common.constant.enums.TaskStatus;
import com.tal.wangxiao.conan.common.domain.ApiInfo;
import com.tal.wangxiao.conan.common.domain.Diff;
import com.tal.wangxiao.conan.common.domain.DiffDetail;
import com.tal.wangxiao.conan.common.domain.TaskApiRelation;
import com.tal.wangxiao.conan.common.entity.db.RecordResult;
import com.tal.wangxiao.conan.common.entity.db.Replay;
import com.tal.wangxiao.conan.common.entity.db.TaskExecution;
import com.tal.wangxiao.conan.common.exception.BaseException;
import com.tal.wangxiao.conan.common.mapper.*;
import com.tal.wangxiao.conan.common.model.DiffResultInRedis;
import com.tal.wangxiao.conan.common.model.JsonKeyDiffResult;
import com.tal.wangxiao.conan.common.redis.RedisTemplateTool;
import com.tal.wangxiao.conan.common.repository.db.RecordResultRepository;
import com.tal.wangxiao.conan.common.repository.db.ReplayRepository;
import com.tal.wangxiao.conan.common.repository.db.TaskExecutionRepository;
import com.tal.wangxiao.conan.common.utils.task.TaskStatusUtil;
import com.tal.wangxiao.conan.utils.diff.TextDiffUtils;
import com.tal.wangxiao.conan.utils.diff.core.TextDiffResult;
import com.tal.wangxiao.conan.utils.json.JsonCheckUtils;
import com.tal.wangxiao.conan.utils.str.StringHandlerUtils;
import com.tal.wangxiao.json.compare.comparator.JSONKeyCompare;
import com.tal.wangxiao.json.compare.result.JSONCompareResult;
import com.tal.wangxiao.json.compare.utils.JSONResultHandlerUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.NumberFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * ??????Diff???????????????
 */
@Slf4j
@Service
public class DiffServiceImpl implements AgentDiffService {

    @Resource
    private DiffMapper diffMapper;

    @Resource
    DiffDetailMapper diffDetailMapper;

    @Resource
    TaskMapper taskMapper;


    @Resource
    private RedisTemplate<Object, Object> redisTemplateLog;


    @Resource
    private RecordResultRepository recordResultRepository;


    @Resource
    private StringRedisTemplate stringRedisTemplate;


    @Resource
    private RedisTemplateTool redisTemplateTool;

    @Resource
    private RedisTemplate<String, String> redisTemplate;

    @Resource
    private TaskStatusUtil taskStatusUtil;

    @Resource
    TaskApiRelationMapper taskApiRelationMapper;

    @Resource
    TaskExecutionRepository taskExecutionRepository;

    @Resource
    ReplayRepository replayRepository;


   /* @Resource
    private ApiDiffSchemeRelationRepository apiDiffSchemeRelationRepository;*/


    //??????diff??????
    //??????????????????Redis???key = 'requestId-recordId-replayId-apiId'
    @Override
    public void startDiff(Integer taskExecutionId, Integer recordId, Integer replayId, Integer diffId) throws BaseException {
        try {
            startDiffDetaile(taskExecutionId, recordId, replayId, diffId);
        } catch (Exception e) {
            log.error("e={}", e);
        }

    }

    private void startDiffDetaile(Integer taskExecutionId, Integer recordId, Integer replayId, Integer diffId) throws BaseException {
        DiffMode diffMode = initDiffMode(taskExecutionId, recordId, replayId, diffId);
        List<Integer> apiList = diffMapper.getRecordIdApiById(recordId);
        //??????record_id ???record_result???????????? apiId list
        JsonKeyDiffResult jsonKeyDiffResult = new JsonKeyDiffResult();
        HashMap<Integer, Object> resultMap = new HashMap<Integer, Object>(apiList.size());
        log.info("api list id {}", apiList.toString());
        //??????????????????
        int progress = 10;
        redisTemplateTool.setDiffProgress(diffId, "10");
        int growSize = 80 / apiList.size();//??????????????????
        //??????apiID diff?????????redis
        for (Integer apiId : apiList) {
            //???????????? record_id ??????api???request_ID set??????
            List<RecordResult> findByRecordIdAndApiId = recordResultRepository.findByRecordIdAndApiId(recordId, apiId);
            Set<String> apiRequestSet = new HashSet<String>();
            for (RecordResult requestResult : findByRecordIdAndApiId) {
                apiRequestSet.add(requestResult.getRequestId());
            }
            List<HashMap> jsonCompareResultsList = new ArrayList<HashMap>(apiRequestSet.size());
            resultMap.put(apiId, jsonCompareResultsList);
            int count = 0;
            for (String requestId : apiRequestSet) {
                count++;
                //?????????json redis key
                String compreDataKey = requestId + "-" + recordId + "-" + replayId + "-" + apiId;
                log.info("compreDataKey= {}", compreDataKey);
                //??????json redis key
                //baseJson ???replay????????????????????? ??????task_excution_id ?????????????????????replay_id????????????json
                String BaseDataKey = requestId + "-" + recordId + "-" + diffMode.getBaseReplayId() + "-" + apiId;
                log.info("BaseDataKey=" + BaseDataKey);
                //??????diff??????
                String compareJson = strReplceHandler(redisTemplate.opsForValue().get(compreDataKey));
                String baseJson = strReplceHandler(redisTemplate.opsForValue().get(BaseDataKey));
                //response is JSON, compareJson ??? BaseDataKey ??????JSON
                if (diffMode.getTaskApiRespnseIsJsonMap().get(apiId) == null) {
                    textDiffJsonSchema(jsonKeyDiffResult, baseJson, compareJson, jsonCompareResultsList);
                } else {
                    if (diffMode.getTaskApiRespnseIsJsonMap().get(apiId) == 0) {
                        if (!JsonCheckUtils.isJSONValidByalibaba(compareJson)) {
                            //??????????????????????????????????????????
                            jsonKeyDiffResult.setEqual(false);
                            jsonKeyDiffResult.setTotalMsgCount(1);
                            jsonKeyDiffResult.setDiffMsgCount(1);
                            resultWriteRedis(jsonKeyDiffResult, diffMode, apiId, requestId);
                            continue;
                        }
                    }

                    if ((null == compareJson || "".equals(compareJson)) || (null == baseJson || "".equals(baseJson))) {
                        log.info("???????????????json???redis key=" + compreDataKey + "???baseJson???redis key=" + BaseDataKey + "?????????redis??????Value");
                        redisTemplateTool.setLogByDiffId_ERROR(diffId, "???????????????json???redis key=" + compreDataKey + "???baseJson???redis key=" + BaseDataKey + "?????????redis??????Value");
                        continue;
                    }
                    int diffType = 0;
                    HashMap<Integer, TaskApiRelation> taskApiRelationHashMap = diffMode.getTaskApiRelationMap();
                    if (taskApiRelationHashMap != null) {
                        TaskApiRelation taskApiRelation = taskApiRelationHashMap.get(apiId);
                        if (taskApiRelation != null) {
                            if (taskApiRelation.getDiffType() != null) {
                                diffType = taskApiRelation.getDiffType();
                            }
                        }
                    }

                    switch (diffType) {
                        case 0:
                            isLostArrayAndAddAnddiffJsonSchema(jsonKeyDiffResult, baseJson, compareJson, count, jsonCompareResultsList);
                            break;
                        case 1:
                            textDiffJsonSchema(jsonKeyDiffResult, baseJson, compareJson, jsonCompareResultsList);
                            break;
                        default:
                            isLostArrayAndAddAnddiffJsonSchema(jsonKeyDiffResult, baseJson, compareJson, count, jsonCompareResultsList);

                    }
                }


                resultWriteRedis(jsonKeyDiffResult, diffMode, apiId, requestId);
            }
            progress = progress + growSize;
            redisTemplateTool.setDiffProgress(diffId, String.valueOf(progress));
            editDiffTAndDetailTable(diffId, recordId, replayId, apiId, diffMode);
        }

        try {
            jsonCompareKeyHandler(resultMap, diffMode);
            redisTemplateTool.setDiffProgress(diffId, "95");
        } catch (Exception e) {
            log.error("diff ???????????????????????? e=" + e);
        }
        editDiffTable(diffId, taskExecutionId);

    }


    private String strReplceHandler(String str) {
        if (StringHandlerUtils.isNull(str)) {
            return "";
        }
        if (str.length() < 2) {
            return "";
        }
        if (str.trim().substring(0, 1).equals("\"")) {
            str = str.substring(1, str.length());
        }
        if (str.trim().substring(str.length() - 2, str.length() - 1).equals("\"")) {
            str = str.substring(0, str.length() - 1);
        }
        str = str.replace("\\", "");
        return str;
    }


    private void resultWriteRedis(JsonKeyDiffResult jsonKeyDiffResult, DiffMode diffMode, Integer apiId, String requestId) {
        //???redis???????????????
        if (Objects.isNull(jsonKeyDiffResult)) {
            return;
        }

        DiffResultInRedis diffResultInRedis = new DiffResultInRedis();
        diffResultInRedis.setAllKeysNu(jsonKeyDiffResult.getTotalMsgCount());
        diffResultInRedis.setSameKeyNu(jsonKeyDiffResult.getTotalMsgCount() - jsonKeyDiffResult.getDiffMsgCount());
        diffResultInRedis.setDiffResult(jsonKeyDiffResult.isEqual());
        //diffResultkey = recordId + "-" + replayId + "-" + apiId + "-" + diffId + "-" + requestId;
        String diffResultKey = diffMode.getRecordId() + "-" + diffMode.getReplayId() + "-" + apiId + "-" + diffMode.getDiffId() + "-" + requestId;
        log.info("diff????????????redis redis key=" + diffResultKey);
        try {
            redisTemplateLog.opsForValue().set(diffResultKey, diffResultInRedis, CodeCache.getRedisCacheTime(), TimeUnit.DAYS);
        } catch (Exception e) {
            //??????????????????ID???????????????Redis, key='logBydiffId='+diffId
            redisTemplateTool.setLogByDiffId_ERROR(diffMode.getDiffId(), "diff????????????redis?????????????????????????????? redis key=" + diffResultKey + ",errMsg = " + e.getMessage());
            log.error("diff????????????redis?????? redis key=" + diffResultKey + ",errMsg = " + e.getMessage());
        }
    }


    /**
     * ????????????
     */
    private void textDiffJsonSchema(JsonKeyDiffResult jsonKeyDiffResult, String baseJson, String compareJson, List<HashMap> jsonCompareResultsList) {
        TextDiffResult textDiffResult = TextDiffUtils.stringDiff(baseJson, compareJson);
        jsonKeyDiffResult.setEqual(textDiffResult.isEqual());
        jsonKeyDiffResult.setTotalMsgCount(textDiffResult.getTotalMsgCount());
        jsonKeyDiffResult.setDiffMsgCount(textDiffResult.getDiffMsgCount());
    }

    /**
     * ????????????????????????????????????diff json ??????
     */
    private void isLostArrayAndAddAnddiffJsonSchema(JsonKeyDiffResult jsonKeyDiffResult, String baseJson, String compareJson, Integer count, List<HashMap> jsonCompareResultsList) {

        try {
            JSONCompareResult jsonCompareResult = new JSONCompareResult();
            jsonCompareResult = JSONKeyCompare.compareJSON_FFTTF(baseJson, compareJson);
            HashMap<Integer, JSONCompareResult> comparJSONMap = new HashMap<Integer, JSONCompareResult>();
            comparJSONMap.put(count, jsonCompareResult);
            jsonCompareResultsList.add(comparJSONMap);
            log.error("jsonCompareResult = " + jsonCompareResult);
            if (jsonCompareResult.isSuccess()) {
                jsonKeyDiffResult.setEqual(jsonCompareResult.isSuccess());
                jsonKeyDiffResult.setTotalMsgCount(1);
                jsonKeyDiffResult.setDiffMsgCount(0);
            } else {
                jsonKeyDiffResult.setEqual(false);
                jsonKeyDiffResult.setTotalMsgCount(1);
                jsonKeyDiffResult.setDiffMsgCount(1);
            }
        } catch (Exception e) {
            jsonKeyDiffResult.setEqual(false);
            jsonKeyDiffResult.setTotalMsgCount(1);
            jsonKeyDiffResult.setDiffMsgCount(1);
            log.error("e =" + e + "????????????????????????JSON???base=" + baseJson + "compareJson=" + compareJson);
        }
    }


    private void jsonCompareKeyHandler(HashMap<Integer, Object> resultMap, DiffMode diffMode) {

        ArrayList<Object> resultSetMeg = new ArrayList<>();
        for (Integer apiId : resultMap.keySet()) {
            List<HashMap> jsonCompareResultList = (List<HashMap>) resultMap.get(apiId);
            JSONObject jsonObject = JSONResultHandlerUtils.getSimpleCompareResultJSONObject(jsonCompareResultList);
            if (jsonObject.size() < 1) {
                continue;
            }
            log.info("jsonCompareResult.getMessage() = {}", jsonObject);
            HashMap map = new HashMap<String, Object>();
            map.put(diffMode.getTaskApiNameMap().get(apiId), jsonObject);
            resultSetMeg.add(map);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", resultSetMeg);
        try {
            Diff diffInfo = diffMapper.selectDiffById(diffMode.getDiffId());
            diffInfo.setDiffErrorMsg(jsonObject.toJSONString());
            log.info("jsonObject= {}", jsonObject.toJSONString());
            diffMapper.updateDiff(diffInfo);
        } catch (Exception e) {
            log.info("????????????????????? = ");
        }

    }


    //???redis???????????????apiID ??????request???diff?????? ????????????diff_detail????????????????????????
    public void editDiffTAndDetailTable(Integer diffId, Integer recordId, Integer replayId, Integer apiId, DiffMode diffMode) throws BaseException {
        final String prefix = recordId + "-" + replayId + "-" + apiId + "-" + diffId + "-*";
        DiffDetail diffDetail = new DiffDetail();
        Set<String> keys = stringRedisTemplate.keys(prefix);
        //diff_detail ??????actual_count diff????????????????????????
        int actual_count = 0;
        //diff_detail ??????expect_count ????????????
        float successRate = 0;
        int expect_count = 0;
        for (String key : keys) {
            log.error("key = " + key);
            Object obj = redisTemplateLog.opsForValue().get(key);
            if (StringHandlerUtils.isNull(obj)) {
                log.error("redis ??????null");
                continue;
            }
            DiffResultInRedis diffResultInRedis = (DiffResultInRedis) obj;
            //diff_detail ??????actual_count2
            expect_count++;
            if (diffResultInRedis.isDiffResult() == true) {
                actual_count++;
            }
        }
        if (expect_count != 0) {
            diffDetail.setActualCount(actual_count);
            diffDetail.setApiId(apiId);
            diffDetail.setExpectCount(expect_count);
            diffDetail.setDiffId(diffId);
            try {
                diffDetailMapper.insertDiffDetail(diffDetail);
            } catch (Exception e) {
                redisTemplateTool.setLogByDiffId_INFO(diffId, "apiId???" + apiId + "diffId???" + diffId + "?????????????????????????????????");
                log.info("apiId???" + apiId + "diffId???" + diffId + "?????????????????????????????????");
            }
            successRate = (actual_count * 100.0f) / expect_count;
        } else {
            successRate = 0;
            redisTemplateTool.setLogByDiffId_INFO(diffId, "apiId???" + apiId + "diffId???" + diffId + "??????????????????0????????????redis????????????diff??????");
            log.info("apiId???" + apiId + "diffId???" + diffId + "??????????????????0????????????redis????????????diff??????");
        }
        String apiName = diffMode.getTaskApiNameMap().get(apiId);
        if (StringHandlerUtils.isNull(apiName)) {
            redisTemplateTool.setLogByDiffId_INFO(diffId, "??????????????????api_id=" + apiId + "?????????");
        } else {
            redisTemplateTool.setLogByDiffId_INFO(diffId, "api=" + apiName + "???????????? ,????????? : " + successRate + "%");
        }
    }


    private DiffMode initDiffMode(Integer taskExecutionId, Integer recordId, Integer replayId, Integer diffId) throws BaseException {
        log.info("??????????????????, diff_id = {}", diffId);
        redisTemplateTool.setDiffProgress(diffId, "1");
        DiffMode diffMode = new DiffMode();
        diffMode.setTaskExcutionId(taskExecutionId);
        diffMode.setRecordId(recordId);
        diffMode.setReplayId(replayId);
        diffMode.setDiffId(diffId);

        Optional<TaskExecution> taskExecutionOptional = taskExecutionRepository.findById(taskExecutionId);
        if (!taskExecutionOptional.isPresent()) {
            log.error("??????????????????????????????, task_execution_id =" + taskExecutionId);
            throw new BaseException("??????????????????????????????, task_execution_id =" + taskExecutionId);
        }
        Integer taskId = taskExecutionOptional.get().getTaskId();
        redisTemplateTool.setLogByDiffId_START(diffId, "??????????????????, diff_id = " + diffId);
        //???????????????????????????????????????taskExecutionId
        List<Replay> replayList = replayRepository.findAllByTaskExecutionIdAndIsBaseline(taskExecutionId, true);
        if (replayList.size() != 1) {
            log.error("????????????????????????, ?????????size = " + replayList.size() + ",taskExecutionId = " + taskExecutionId);
            throw new BaseException("????????????????????????, ?????????size = " + replayList.size() + ",taskExecutionId = " + taskExecutionId);
        }
        Replay baseReplay = replayList.get(0);
        Integer baseReplayId = baseReplay.getId();
        redisTemplateTool.setLogByDiffId_INFO(diffId, "?????????????????? replay_id = " + replayId + "????????????,base replay_id=" + baseReplayId);
        redisTemplateTool.setDiffProgress(diffId, "2");
        List<RecordResult> recordResultList = recordResultRepository.findByRecordId(recordId);
        if (null == recordResultList || recordResultList.isEmpty()) {
            log.error("recordId" + recordId + "?????????requestId");
            throw new BaseException("recordId" + recordId + "?????????requestId");
        }
        //??????????????????????????????????????????????????????diff???
        Diff diff = diffMapper.selectDiffById(diffId);
        diff.setBaseReplayId(baseReplayId);
        diffMapper.updateDiff(diff);

        diffMode.setTaskId(taskId);
        diffMode.setBaseReplayId(baseReplayId);
        TaskApiRelation taskApiRelation = new TaskApiRelation();
        taskApiRelation.setTaskId(taskId);
        List<TaskApiRelation> taskApiRelationList = taskApiRelationMapper.selectTaskApiRelationList(taskApiRelation);
        HashMap<Integer, TaskApiRelation> taskApiRelationMap = new HashMap<Integer, TaskApiRelation>();
        for (TaskApiRelation taskApiRelationDb : taskApiRelationList) {
            taskApiRelationMap.put(taskApiRelationDb.getApiId(), taskApiRelationDb);
        }
        diffMode.setTaskApiRelationMap(taskApiRelationMap);

        HashMap<Integer, Integer> taskApiResponseIsJsonMap = new HashMap<>();
        HashMap<Integer, String> taskApiNameMap = new HashMap<>();
        List<ApiInfo> requestIdApiList = diffMapper.getApiInfoById(recordId);
        for (ApiInfo apiInfo : requestIdApiList) {
            taskApiResponseIsJsonMap.put(apiInfo.getApiId(), apiInfo.getResponseIsJson());
            taskApiNameMap.put(apiInfo.getApiId(), apiInfo.getName());
        }
        diffMode.setTaskApiRespnseIsJsonMap(taskApiResponseIsJsonMap);
        diffMode.setTaskApiNameMap(taskApiNameMap);
        return diffMode;
    }


    //??????diff????????????
    public void editDiffTable(int diffId, Integer taskExecutionId) throws BaseException {
        Diff diff = diffMapper.selectDiffById(diffId);
        if (diff == null) {
            //??????????????????ID???????????????Redis, key='logBydiffId='+diffId
            redisTemplateTool.setLogByDiffId_INFO(diffId, "????????????diff???????????????????????????" + diffId);
            redisTemplateTool.setLogByDiffId_ERROR(diffId, "????????????(end)");
            throw new BaseException("????????????diff???????????????????????????" + diffId);
        }
        //??????diffId???????????????api????????????  ??????actual/??????expect
        DiffDetail diffDetailCondition = new DiffDetail();
        diffDetailCondition.setDiffId(diffId);
        List<DiffDetail> diffDetailList = diffDetailMapper.selectDiffDetailList(diffDetailCondition);
        int totalActual = 0;
        int totalExpect = 0;
        for (DiffDetail diffDetail : diffDetailList) {
            totalActual += diffDetail.getActualCount();
            totalExpect += diffDetail.getExpectCount();
        }
        NumberFormat numberFormat = NumberFormat.getInstance();
        numberFormat.setMaximumFractionDigits(2);
        double success_rate = 0;
        if (totalExpect != 0) {
            success_rate = (totalActual * 100.0) / totalExpect;
        }
        log.info("??????????????????" + totalExpect + ",?????????????????????" + totalActual);
        diff.setUpdateTime(new Date());
        diff.setSuccessRate(success_rate);
        diffMapper.updateDiff(diff);
        redisTemplateTool.setLogByDiffId_INFO(diffId, "??????????????????diffId=" + diffId + "??????????????????????????????????????????" + success_rate + "%");
        redisTemplateTool.setLogByDiffId_ERROR(diffId, "????????????(end)");
        taskStatusUtil.updateTaskStatus(taskExecutionId, TaskStatus.DIFF_SUCCESS);

    }



    /*    private void jsonCompareKeyHandler(HashMap<Integer, Object> resultMap, Integer diffId) {

        ArrayList<Object> resultSetMeg = new ArrayList<>();
        for (Integer apiId : resultMap.keySet()) {
            List<HashMap> jsonCompareResultList = (List<HashMap>) resultMap.get(apiId);
            JSONObject jsonObject = JSONResultHandlerUtils.getSimpleCompareResultJSONObject(jsonCompareResultList);
            if (jsonObject.size() < 1) {
                continue;
            }
            logger.info("jsonCompareResult.getMessage() = " + jsonObject);
            try {
                String apiName = diffDao.getApiNAme(apiId);
                if (StringHandlerUtils.isNull(apiName)) {
                    continue;
                }
                HashMap map = new HashMap<String, Object>();
                map.put(apiName, jsonObject);
                resultSetMeg.add(map);

            } catch (Exception e) {
                logger.info("??????????????????apiId = " + apiId);
                continue;
            }
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", resultSetMeg);
        try {
            DiffInfo diffInfo = diffDao.getDiffInfoById(diffId);
            diffInfo.setDiffErrorMsg(jsonObject.toJSONString());
            logger.info("jsonObject= " + jsonObject.toJSONString());
            diffDao.updateById(diffInfo);
        } catch (Exception e) {
            logger.info("????????????????????? = ");
        }

    }*/


    //?????????????????????????????????????????????
   /* private void jsonCompareKeyHandler(HashMap<Integer, Object> resultMap, Integer diffId) {

        HashSet<String> resultSetMeg = new HashSet<>();
        for (Integer o : resultMap.keySet()) {
            List<JSONCompareResult> jsonCompareResultList = (List<JSONCompareResult>) resultMap.get(o);
            HashSet<String> resultSet = new HashSet<>();

            for (JSONCompareResult jsonCompareResult : jsonCompareResultList) {
                if (jsonCompareResult.isSuccess()) {
                    continue;
                }
                if (jsonCompareResult.getMessage() == null) {
                    continue;
                }
                String[] strNumber = jsonCompareResult.getMessage().toString().split(",");
                logger.info("jsonCompareResult.getMessage() = " + jsonCompareResult.getMessage());
                for (String errormeg : strNumber) {
                    logger.info("errormeg = " + errormeg);
                    if (errormeg.equals("Object Key??????")) {
                        resultSet.add("key??????");
                    } else if (errormeg.equals("Object Key????????????")) {
                        resultSet.add("key??????");
                    } else {

                        resultSet.add(errormeg);
                    }
                }
            }
            StringBuilder stringBuilder = new StringBuilder();
            String meg = "";
            for (String str : resultSet) {
                stringBuilder.append(str).append(",");
            }
            if (resultSet.size() > 0) {
                meg = stringBuilder.toString().substring(0, stringBuilder.toString().length() - 1);
                try {
                    String apiName=  diffDao.getApiNAme(o);
                    if(StringHandlerUtils.isNull(apiName)) {
                        continue;
                    }
                    meg = apiName + ":" + meg;
                } catch (Exception e) {
                    logger.info("??????????????????apiId = " + o);
                    continue;
                }
            }
            if(!StringHandlerUtils.isNull(meg)) {
                resultSetMeg.add(meg);
            }
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data" ,resultSetMeg);
        DiffInfo diffInfo = diffDao.getDiffInfoById(diffId);
        diffInfo.setDiffErrorMsg(jsonObject.toJSONString());
        logger.info("jsonObject= " + jsonObject.toJSONString());
        diffDao.updateById(diffInfo);

    }*/


}
