CREATE TABLE `transaction_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `messageId` varchar(255) NULL DEFAULT '',
  `topic` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `messageKey` varchar(50)  NULL DEFAULT '' COMMENT '业务自定义Key',
  `messageType` varchar(50) NOT NULL DEFAULT '' COMMENT '消息类型 0普通消息 1延迟消息 2顺序消息',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0等待发送  1已发送',
  `message` text NOT NULL COMMENT 'Message消息Json内容',
  `sendCount` int(4) NOT NULL DEFAULT '0' COMMENT '重复发送消息次数',
  `sendTime` datetime DEFAULT NULL COMMENT '最近发送消息时间',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `consumeFailCount` int(4) DEFAULT '0' COMMENT '消费失败次数',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `traces` mediumtext COMMENT '消息轨迹',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='本地事务消息';

CREATE TABLE `idempotent_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(50) NULL DEFAULT '',
  `value` varchar(50) NOT NULL DEFAULT '',
  `expireTime` timestamp NOT NULL COMMENT '过期时间',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幂等记录';
