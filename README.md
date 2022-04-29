## 柯南流量回放平台
[English](README.md) | 简体中文
<p align="left">
    <a href="https://github.com/1042970366/">
        <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT License" />
    </a>
    <a href="https://java.org/">
        <img src="https://img.shields.io/badge/java-1.8.1-green" alt="Vue2.0">
    </a>
    <a href="https://vuejs.org/">
        <img src="https://img.shields.io/badge/vue.js-2.0-green" alt="Vue2.0">
    </a>
    <a href="https://github.com/1042970366/">
        <img src="https://img.shields.io/badge/author-TALconan-blueviolet" alt="Author">
    </a>
    <a href="https://github.com/1042970366/">
        <img src="https://img.shields.io/badge/🚀-open--in--browser-blueviolet" alt="Live Demo">
    </a>
</p>

经过在线教育业务中的持续打磨与迭代，柯南平台终于开源，旨在为行业内更多的的质效保障团队提供更专业更稳定的质效保障方案。随着业务与技术架构的不断变化，服务端的质量保障工作变得越来越复杂。近几年流量回放的方案在行业内落地生根，但大部分以工具为主并且使用成本与二次开发生成本较高，柯南平台应运而生。

## 版本变更
由于现在未在好未来就职，还想继续完善conan 这个开源项目，为了方便维护，重新基于原来版本继续开发，继续开发场景测试，压测场景构造，写接口配置等模块开发，由于代码库在原公司下，提交代码不方便，便于及时更新迁移到个人代码库上，原来公司conan版本将不继续更新，将在这个版本继续更新

## 目标
基于线上真实用户流量的录制回放能力与结果校验能力，为冒烟测试，集成回归测试，线上验证与线上巡检提供解决方案。


## 核心功能
**流量采集**

基于ES日志源的流量录制采集，平台化配置接入，降低使用成本，并且提供详细的流量采集数据。


**流量回放**

分布式的后端架构，为流量回放提升执行效率，支持服务鉴权配置，基于http协议的回放符合真实业务场景。

**结果校验**

流量回放的常规校验方式基本上是以流量结果的DIFF为主，但大量的流量噪声（时间戳，自增数据...）一直影响结果的准确性，柯南平台在回放中基于配置的jsonSchema做第一层校验，再结合自研的降噪比对服务进行流量DIFF的第二层校验，从而保障了结果校验的准确性，大大提升了流量回放结果的可信度。


## 平台优势与应用场景
**优势**
- 解决传统自动化覆盖率低，维护成本高的问题
- 多规则的流量结果断言校验
- 多规则的流量结果比对支持
- 流量数据可用于自动化测试与性能测试
- 交互简单，配置化接入
- 开源共建，持续优化

**应用场景**
- 提测质量卡点
- CI/CD流水线质量卡点
- 服务线上监控巡检


**平台业务架构**    
![后端业务架构.png](http://ttc-tal.oss-cn-beijing.aliyuncs.com/1605259627/%E5%90%8E%E7%AB%AF%E4%B8%9A%E5%8A%A1%E6%9E%B6%E6%9E%84.png)
<center>
业务架构
</center>

**平台技术架构**  
![后端技术架构.png](http://ttc-tal.oss-cn-beijing.aliyuncs.com/1605255935/%E5%90%8E%E7%AB%AF%E6%8A%80%E6%9C%AF%E6%9E%B6%E6%9E%84.png)
<center>
服务端架构
</center>

<br>

**后端技术架构**  
![后端技术架构.png](https://gitee.com/dengkunnanmayun/conan-docs/raw/master/readmeImage/conanSpringboot%E7%89%88%E6%9C%AC.jpg)
<center>
服务端架构
</center>
原图地址：https://www.processon.com/view/link/626bbafd5653bb5be56b3866
<br>

**平台能力及功能**
![柯南能力图.png](http://ttc-tal.oss-cn-beijing.aliyuncs.com/1605261800/%E6%9F%AF%E5%8D%97%E8%83%BD%E5%8A%9B%E5%9B%BE.png)

**使用须知**
- 流量采集: ES日志；
- 回放协议: http协议；
- 具体环境可参考开源详细技术文档

## 写在最后
质效的提升也许不能单单通过一个平台，技术与人的结合才能带来更大的突破。善于利用技术创新才能从容的面对越来越频繁的需求，越来越复杂的业务，柯南平台的技术方案产出于学而思网校的大班业务并且逐步通用化，平台现已开源，希望更多优秀的人或团队参与进来，为质效保障工作提供更多的解决方案。

**详细使用文档**
https://dengkunnanmayun.gitee.io/conan-docs/#/use/README

**更多介绍**
https://mp.weixin.qq.com/s/1Cvi5kkqfF9y1rBi97qLwg

</br>

**基础版本地址**
https://github.com/tal-tech/conan

**柯南官方QQ群**

<img src="http://ttc-tal.oss-cn-beijing.aliyuncs.com/1614485571/image.png" width="150" height="230" align="middle" />

<br>