package org.seckill.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import java.util.List;

/**
 * seckillService 测试类
 * Created by Administrator on 2016/6/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
@TransactionConfiguration(defaultRollback=false)
public class SeckillServiceTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SeckillService seckillService;

    @Test
    public void getSeckillList() throws Exception {
        List<Seckill> list = seckillService.getSeckillList();
        //{}是占位符
        logger.info("list={}", list);
    }

    @Test
    public void getById() throws Exception {

        Seckill seckill = seckillService.getById(1);
        logger.info("seckill={}", seckill);
    }

    //集成测试代码完整逻辑
    @Test
    public void exportSeckillLogic(){
        long id = 1;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        if (exposer.isExposed()){
            try {
                long phone = 17098906179L;
                String md5 = exposer.getMd5();
                SeckillExecution seckillExecution = seckillService.executeSeckill(id, phone, md5);
                logger.info("seckillExecution = {}", seckillExecution);
            } catch (SeckillCloseException e) {
                logger.error(e.getMessage());
            } catch (RepeatKillException e) {
                logger.error(e.getMessage());
            }
        }else {
            //秒杀未开启
            logger.warn("expose:{}", exposer);
        }
    }
/*    Exposer{exposed=true, md5='0839545eda108d8279e0210e8319ee74', seckillId=1, now=0, start=0, end=0}*/


}