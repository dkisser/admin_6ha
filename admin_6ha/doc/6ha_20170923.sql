/*
Navicat MySQL Data Transfer

Source Server         : wenchen
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : 6ha

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2017-09-23 11:28:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authory`
-- ----------------------------
DROP TABLE IF EXISTS `authory`;
CREATE TABLE `authory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `power` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of authory
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `belongs` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '武汉市', '17');
INSERT INTO `city` VALUES ('2', '十堰市', '17');
INSERT INTO `city` VALUES ('3', '神农架区', '17');
INSERT INTO `city` VALUES ('4', '襄樊市', '17');
INSERT INTO `city` VALUES ('5', '随州市', '17');
INSERT INTO `city` VALUES ('6', '荆门市', '17');
INSERT INTO `city` VALUES ('7', '宜昌市', '17');
INSERT INTO `city` VALUES ('8', '恩施土家族苗族自治州', '17');
INSERT INTO `city` VALUES ('9', '荆州市', '17');
INSERT INTO `city` VALUES ('10', '潜江市', '17');
INSERT INTO `city` VALUES ('11', '仙桃市', '17');
INSERT INTO `city` VALUES ('12', '天门市', '17');
INSERT INTO `city` VALUES ('13', '孝感市', '17');
INSERT INTO `city` VALUES ('14', '黄冈市', '17');
INSERT INTO `city` VALUES ('15', '鄂州市', '17');
INSERT INTO `city` VALUES ('16', '黄石市', '17');
INSERT INTO `city` VALUES ('17', '咸宁市', '17');
INSERT INTO `city` VALUES ('18', '东城区', '1');
INSERT INTO `city` VALUES ('19', '西城区', '1');
INSERT INTO `city` VALUES ('20', '朝阳区', '1');
INSERT INTO `city` VALUES ('21', '丰台区', '1');
INSERT INTO `city` VALUES ('22', '石景山区', '1');
INSERT INTO `city` VALUES ('23', '海淀区', '1');
INSERT INTO `city` VALUES ('24', '门头沟区', '1');
INSERT INTO `city` VALUES ('25', '房山区', '1');
INSERT INTO `city` VALUES ('26', '通州区', '1');
INSERT INTO `city` VALUES ('27', '顺义区', '1');
INSERT INTO `city` VALUES ('28', '昌平区', '1');
INSERT INTO `city` VALUES ('29', '大兴区', '1');
INSERT INTO `city` VALUES ('30', '怀柔区', '1');
INSERT INTO `city` VALUES ('31', '平谷区', '1');
INSERT INTO `city` VALUES ('32', '密云区', '1');
INSERT INTO `city` VALUES ('33', '延庆区', '1');
INSERT INTO `city` VALUES ('34', '和平区', '2');
INSERT INTO `city` VALUES ('35', '河西区', '2');
INSERT INTO `city` VALUES ('36', '河东区', '2');
INSERT INTO `city` VALUES ('37', '河北区', '2');
INSERT INTO `city` VALUES ('38', '红桥区', '2');
INSERT INTO `city` VALUES ('39', '南开区', '2');
INSERT INTO `city` VALUES ('40', '黄浦区', '3');
INSERT INTO `city` VALUES ('41', '徐汇区', '3');
INSERT INTO `city` VALUES ('42', '长宁区', '3');
INSERT INTO `city` VALUES ('43', '静安区', '3');
INSERT INTO `city` VALUES ('44', '普陀区', '3');
INSERT INTO `city` VALUES ('45', '虹口区', '3');
INSERT INTO `city` VALUES ('46', '万州区', '4');
INSERT INTO `city` VALUES ('47', '涪陵区', '4');
INSERT INTO `city` VALUES ('48', '渝中区', '4');
INSERT INTO `city` VALUES ('49', '大渡口区', '4');
INSERT INTO `city` VALUES ('50', '江北区', '4');
INSERT INTO `city` VALUES ('51', '小店区', '6');
INSERT INTO `city` VALUES ('52', '城区', '6');
INSERT INTO `city` VALUES ('53', '矿区', '6');
INSERT INTO `city` VALUES ('54', '张家口', '5');
INSERT INTO `city` VALUES ('55', '承德', '5');
INSERT INTO `city` VALUES ('56', '石家庄', '5');
INSERT INTO `city` VALUES ('57', '保定', '5');
INSERT INTO `city` VALUES ('58', '邯郸', '5');
INSERT INTO `city` VALUES ('59', '邢台', '5');
INSERT INTO `city` VALUES ('60', '沈阳', '7');
INSERT INTO `city` VALUES ('61', '大连', '7');
INSERT INTO `city` VALUES ('62', '长春', '8');
INSERT INTO `city` VALUES ('63', '通化', '8');
INSERT INTO `city` VALUES ('64', '白山', '8');

-- ----------------------------
-- Table structure for `c_group`
-- ----------------------------
DROP TABLE IF EXISTS `c_group`;
CREATE TABLE `c_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(255) DEFAULT NULL,
  `fzr` varchar(255) DEFAULT NULL,
  `glr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_group
-- ----------------------------
INSERT INTO `c_group` VALUES ('1', '测试一组', 'songhao', 'wenchen');
INSERT INTO `c_group` VALUES ('2', '测试二组', 'wenchen', 'wenchen');
INSERT INTO `c_group` VALUES ('3', '测试三组', 'wenchen3', 'wenchen');
INSERT INTO `c_group` VALUES ('4', '测试四组', 'wenchen4', 'wenchen');
INSERT INTO `c_group` VALUES ('5', '测试五组', 'wenchen5', 'wenchen');
INSERT INTO `c_group` VALUES ('6', '测试六组', 'wenchen6', 'wenchen');

-- ----------------------------
-- Table structure for `c_xwlx`
-- ----------------------------
DROP TABLE IF EXISTS `c_xwlx`;
CREATE TABLE `c_xwlx` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lx_Id` int(11) DEFAULT NULL,
  `lx_Pid` int(11) DEFAULT '0',
  `lx_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_xwlx
-- ----------------------------
INSERT INTO `c_xwlx` VALUES ('1', '1001', '10', '日看点左侧新闻');
INSERT INTO `c_xwlx` VALUES ('2', '1002', '10', '日看点中部新闻');
INSERT INTO `c_xwlx` VALUES ('3', '1003', '10', '日看点右侧新闻');
INSERT INTO `c_xwlx` VALUES ('4', '20', '0', 'NEWS新闻');
INSERT INTO `c_xwlx` VALUES ('5', '10', '0', '游戏日看点');
INSERT INTO `c_xwlx` VALUES ('6', '2001', '20', 'NEWS滚动新闻');

-- ----------------------------
-- Table structure for `eva`
-- ----------------------------
DROP TABLE IF EXISTS `eva`;
CREATE TABLE `eva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eva_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eva
-- ----------------------------
INSERT INTO `eva` VALUES ('1', '个人用户星级评分');
INSERT INTO `eva` VALUES ('2', 'VIP用户星级评分');
INSERT INTO `eva` VALUES ('3', '管理员用户星级评分');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(11) DEFAULT NULL,
  `grade_level` int(11) DEFAULT NULL,
  `upgrade_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '非会员', '0', '1000');
INSERT INTO `grade` VALUES ('2', '心悦会员1', '1', '5000');
INSERT INTO `grade` VALUES ('3', '心悦会员2', '2', '10000');
INSERT INTO `grade` VALUES ('4', '心悦会员3', '3', '20000');
INSERT INTO `grade` VALUES ('5', '心悦会员4', '4', '40000');
INSERT INTO `grade` VALUES ('6', '心悦会员5', '5', '0');

-- ----------------------------
-- Table structure for `j_news`
-- ----------------------------
DROP TABLE IF EXISTS `j_news`;
CREATE TABLE `j_news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dm` varchar(255) DEFAULT NULL,
  `lx` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `sqr` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT '',
  `href` varchar(255) DEFAULT '',
  `date` varchar(255) DEFAULT '',
  `zt` int(2) DEFAULT NULL,
  `remark` blob,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_news
-- ----------------------------
INSERT INTO `j_news` VALUES ('1', '11001', '1001', 'CJ现场看大家如何花式玩VR', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('2', '21001', '1001', '蜗牛《方舟公园》获得NVIDIA针对性显卡优化', 'wenchen', '', 'http://news.17173.com/content/07282017/172907951.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('3', '31001', '1001', '英伟达发布全新GeForceExperience中国版', 'wenchen', '', 'http://news.17173.com/content/07282017/112031044.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('4', '41001', '1001', 'CJ新游抢先看:畅游《军团指挥官》独家解析', 'wenchen', '', 'http://news.17173.com/content/07272017/170826525.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('5', '51001', '1001', 'HTCVive八折优惠!《乖离性亚瑟王》正式上线', 'wenchen', '', 'http://news.17173.com/content/07272017/142028517.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('6', '61001', '1001', 'HYPEREAL第一届开发者大会在上海举行', 'wenchen', '', 'http://news.17173.com/content/07272017/101516498.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('7', '71001', '1001', '无所畏有所为!冰穹互娱未来航线及发布会落幕', 'wenchen', '', 'http://news.17173.com/content/07252017/172020525.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('8', '81001', '1001', 'CJ2017:HTCVIVE宣布推出中国版VIVE一体机', 'wenchen', '', 'http://news.17173.com/content/07272017/102626611.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('9', '91002', '1002', 'VR版疯兔亮相CJ', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/bfXNEnblvzvglgz.jpg', 'http://news.17173.com/content/07252017/112909481.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('10', '101002', '1002', '《罪与罚:末日机甲》', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SeQumyblvEoEdjj.jpg', 'http://news.17173.com/content/07252017/140034320.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('11', '111002', '1002', '《方舟公园》最新预告', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07252017/001011813.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('12', '121002', '1002', '《马赛克别闹》登PSVR', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GDIhCPblwbbhwzg.jpg', 'http://news.17173.com/content/07262017/174908517.shtml', '', '3', '');
INSERT INTO `j_news` VALUES ('13', '131003', '1003', '国产PSVR游戏《基因雨》', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AgRsIYblvCwoyAr.jpg', 'http://news.17173.com/content/07252017/150018016.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('14', '142001', '2001', '明星+电竞+二次元?Chinajoy这家展台全都有', 'wenchen', '', 'http://news.17173.com/content/08102017/153659607_1.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('15', '152001', '2001', '2017ChinaJoy“喔图”用图片直播完美呈现', 'wenchen', '', 'http://news.17173.com/content/08102017/115112180.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('16', '162001', '2001', '聚众互动携新品参展ChinaJoy中国数码娱乐行业扑克邀请赛圆满落幕', 'wenchen', '', 'http://news.17173.com/content/08102017/115017452.shtml', '08-10', '3', '');
INSERT INTO `j_news` VALUES ('17', '172001', '2001', 'Chinajoy人气展台全回顾哪家才是你的菜?', 'wenchen', '', 'http://news.17173.com/content/08092017/115509741.shtml', '08-09', '3', '');
INSERT INTO `j_news` VALUES ('18', '182001', '2001', 'Chinajoy明星网红众生相音乐才子、国民老公引得迷妹尖叫', 'wenchen', '', 'http://news.17173.com/content/08092017/115331157.shtml', '08-09', '3', '');
INSERT INTO `j_news` VALUES ('19', '192001', '2001', '推出西瓜视频App的背后，今日头条想做什么事？', 'wenchen', '', 'http://news.17173.com/content/08052017/104541920_1.shtml', '08-05', '3', '');
INSERT INTO `j_news` VALUES ('20', '202001', '2001', '强安全重体验腾讯游戏渠道吸引众多游戏关注', 'wenchen', '', 'http://news.17173.com/content/08022017/153234205.shtml', '08-02', '3', '');
INSERT INTO `j_news` VALUES ('21', '212001', '2001', '不迎合小白、不向市场妥协：《战意》为啥要这么做？', 'wenchen', '', 'http://news.17173.com/content/08022017/095850672_1.shtml', '08-02', '3', '');
INSERT INTO `j_news` VALUES ('22', '222001', '2001', '《小米枪战》出击2017CJ萌妹,御姐同台竞技!', 'wenchen', '', 'http://news.17173.com/content/08012017/160755601.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('23', '232001', '2001', '完美落幕!2017CJ万代南梦宫（上海）展区精彩回顾', 'wenchen', '', 'http://news.17173.com/content/08012017/143347791.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('24', '242001', '2001', 'CJ花絮:两场另类精彩的“华山论剑”', 'wenchen', '', 'http://news.17173.com/content/08012017/111643574.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('25', '252001', '2001', '宝藏世界开发商：我们和《我的世界》完全不同', 'wenchen', '', 'http://news.17173.com/content/08012017/104947841.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('26', '262001', '2001', '盛大游戏成立了一个新工作室，到底想要做啥事？', 'wenchen', '', 'http://news.17173.com/content/08012017/104801217_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('27', '272001', '2001', 'MOBA如何做好世界观？《虚幻争霸》是这么做的', 'wenchen', '', 'http://news.17173.com/content/08012017/094309143.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('28', '282001', '2001', 'CDPR聊昆特牌:只要是好游戏玩家都愿意玩中国玩家也不例外', 'wenchen', '', 'http://news.17173.com/content/08012017/014919593_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('29', '292001', '2001', '问道手游将加入新玩法《不思议迷宫》迎来大更新', 'wenchen', '', 'http://news.17173.com/content/08012017/002913283_1.shtml', '08-01', '3', '');
INSERT INTO `j_news` VALUES ('30', '302001', '2001', '细数在chinajoy上出现的明星和网红周杰伦、许嵩、五五开.....', 'wenchen', '', 'http://news.17173.com/content/07312017/170102203_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('31', '312001', '2001', '凯撒文化2017CJ精彩回顾:未来可期,感恩有你', 'wenchen', '', 'http://news.17173.com/content/07312017/162524603.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('32', '322001', '2001', '《神武2》CJ舞台众星袁成杰.许嵩.王尼玛加盟', 'wenchen', '', 'http://news.17173.com/content/07312017/162345437.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('33', '332001', '2001', '云更新2017ChinaJoy之行圆满收官', 'wenchen', '', 'http://news.17173.com/content/07312017/161935138.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('34', '342001', '2001', '极限竞速世界锦标赛ChinaJoy邀请赛圆满结束', 'wenchen', '', 'http://news.17173.com/content/07312017/160747094.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('35', '352001', '2001', '超游网络亮相Chinajoy自制自研作品人气爆棚', 'wenchen', '', 'http://news.17173.com/content/07312017/155901047.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('36', '362001', '2001', '聚光灯下的超美小姐姐!2017CJ高端器材下的极品SG第二弹', 'wenchen', '', 'http://news.17173.com/content/07312017/151624373_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('37', '372001', '2001', 'ChinaJoy4399展台美女云集海量照片来袭', 'wenchen', '', 'http://news.17173.com/content/07312017/144044362_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('38', '382001', '2001', '腾讯要出魔力宝贝手游经典IP在15年后有了什么变化', 'wenchen', '', 'http://news.17173.com/content/07312017/143426694_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('39', '392001', '2001', '没有抢到CJ的门票?这里有所有经典游戏的Cosplay', 'wenchen', '', 'http://news.17173.com/content/07312017/143412043.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('40', '402001', '2001', '竞技手游迎来爆发乐逗游戏多款手游产品亮相CJ', 'wenchen', '', 'http://news.17173.com/content/07312017/141525047.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('41', '412001', '2001', '身材更好的小橘子姐姐CJ《QQ飞车》手游试玩', 'wenchen', '', 'http://news.17173.com/content/07312017/140327940.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('42', '422001', '2001', '除了非常英雄完美还带来了3款沙盒般自由的单机', 'wenchen', '', 'http://news.17173.com/content/07312017/140159868_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('43', '432001', '2001', '网易旗舰IP《镇魔曲》手游CJ五大亮点引爆全场', 'wenchen', '', 'http://news.17173.com/content/07312017/135024360.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('44', '442001', '2001', '网易《秘境对决》亮相CJ试玩现场火热直击', 'wenchen', '', 'http://news.17173.com/content/07312017/134531642.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('45', '452001', '2001', '《三国杀》九周年狂欢夜2017ChinaJoy杀迷盛宴', 'wenchen', '', 'http://news.17173.com/content/07312017/123033235.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('46', '462001', '2001', '人气爆棚！ChinaJoy联通小沃燃情开展“包”你玩一夏', 'wenchen', '', 'http://news.17173.com/content/07312017/122821528.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('47', '472001', '2001', '一秒带你回三国《三国如龙传》嗨翻全场', 'wenchen', '', 'http://news.17173.com/content/07312017/120956169.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('48', '482001', '2001', '经典人物重现这很可能就是你想要的《轩辕剑》手游', 'wenchen', '', 'http://news.17173.com/content/07312017/112623584_1.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('49', '492001', '2001', '《灵魂武器》定名《超魂觉醒》360代理秋季首测', 'wenchen', '', 'http://news.17173.com/content/07312017/110757575.shtml', '07-31', '3', '');
INSERT INTO `j_news` VALUES ('51', '511001', '1001', '2017-08-23 14:12:12插入的测试数据0', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('52', '521001', '1001', '2017-08-23 14:12:13插入的测试数据1', 'baba', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('53', '531001', '1001', '2017-08-23 14:12:13插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('54', '541001', '1001', '2017-08-23 14:12:13插入的测试数据3', 'weewq', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('55', '551001', '1001', '2017-08-23 14:12:13插入的测试数据4', 'wenchen9', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('56', '561001', '1001', '2017-08-23 14:12:54插入的测试数据0', 'wenchen5', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('57', '571001', '1001', '2017-08-23 14:12:55插入的测试数据1', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('58', '581001', '1001', '2017-08-23 14:12:55插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('59', '591001', '1001', '2017-08-23 14:12:55插入的测试数据3', 'wenchen1', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('60', '601001', '1001', '2017-08-23 14:12:55插入的测试数据4', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('61', '611001', '1001', '2017-08-23 14:13:48插入的测试数据0', 'wenchen8', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('62', '621001', '1001', '2017-08-23 14:13:48插入的测试数据1', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('63', '631001', '1001', '2017-08-23 14:13:48插入的测试数据2', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('64', '641001', '1001', '2017-08-23 14:13:48插入的测试数据3', 'DSDS', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('65', '651001', '1001', '2017-08-23 14:13:48插入的测试数据4', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('66', '661001', '1001', '2017-08-23 14:14:36插入的测试数据0', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('67', '671001', '1001', '2017-08-23 14:14:36插入的测试数据1', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('68', '681001', '1001', '2017-08-23 14:14:36插入的测试数据2', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('69', '691001', '1001', '2017-08-23 14:14:36插入的测试数据3', 'wenchen7', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('70', '701001', '1001', '2017-08-23 14:14:36插入的测试数据4', 'wenchen6', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('71', '711003', '1003', '2017-08-24 11:19:40插入的测试数据0', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('72', '721003', '1003', '2017-08-24 11:19:40插入的测试数据1', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('73', '731003', '1003', '2017-08-24 11:19:40插入的测试数据2', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('74', '741003', '1003', '2017-08-24 11:19:40插入的测试数据3', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('75', '751003', '1003', '2017-08-24 11:19:40插入的测试数据4', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('76', '761003', '1003', '2017-08-24 11:19:54插入的测试数据0', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('77', '771003', '1003', '2017-08-24 11:19:54插入的测试数据1', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('78', '781003', '1003', '2017-08-24 11:19:54插入的测试数据2', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('79', '791003', '1003', '2017-08-24 11:19:54插入的测试数据3', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('80', '801003', '1003', '2017-08-24 11:19:54插入的测试数据4', 'ds', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('81', '811003', '1003', '2017-08-24 11:20:08插入的测试数据0', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('82', '821003', '1003', '2017-08-24 11:20:08插入的测试数据1', 'wenchen4', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('83', '831003', '1003', '2017-08-24 11:20:08插入的测试数据2', 'wenchen2', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('84', '841003', '1003', '2017-08-24 11:20:09插入的测试数据3', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('85', '851003', '1003', '2017-08-24 11:20:09插入的测试数据4', 'dsd111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('86', '861003', '1003', '2017-08-24 11:20:21插入的测试数据0', 'wenjiabao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('87', '871003', '1003', '2017-08-24 11:20:21插入的测试数据1', 'adasz', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('88', '881003', '1003', '2017-08-24 11:20:21插入的测试数据2', 'dsdsdsa', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('89', '891003', '1003', '2017-08-24 11:20:21插入的测试数据3', 'wenchen9', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('90', '901003', '1003', '2017-08-24 11:20:21插入的测试数据4', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('91', '911003', '1003', '2017-08-24 11:20:32插入的测试数据0', 'wenchen12', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('92', '921003', '1003', '2017-08-24 11:20:32插入的测试数据1', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('93', '931003', '1003', '2017-08-24 11:20:32插入的测试数据2', 'wenchen11', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('94', '941003', '1003', '2017-08-24 11:20:32插入的测试数据3', 'wenchen111', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('95', '951003', '1003', '2017-08-24 11:20:32插入的测试数据4', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('96', '961003', '1003', '2017-08-24 11:21:42插入的测试数据0', 'aqza', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('97', '971003', '1003', '2017-08-24 11:21:42插入的测试数据1', 'songhao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('98', '981003', '1003', '2017-08-24 11:21:42插入的测试数据2', 'likeqiang', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('99', '991003', '1003', '2017-08-24 11:21:42插入的测试数据3', 'wenchen', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('100', '1001003', '1003', '2017-08-24 11:21:42插入的测试数据4', 'ms', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('101', '1011003', '1003', '2017-08-24 12:03:41插入的测试数据0', 'sd', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('102', '1021003', '1003', '2017-08-24 12:03:41插入的测试数据1', 'wenchen1112a', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('103', '1031003', '1003', '2017-08-24 12:03:41插入的测试数据2', 'xijinping', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('104', '1041003', '1003', '2017-08-24 12:03:41插入的测试数据3', 'zhangjie', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('105', '1051003', '1003', '2017-08-24 12:03:41插入的测试数据4', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('106', '1061003', '1003', '2017-08-24 12:07:06插入的测试数据0', 'gggg', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('107', '1071003', '1003', '2017-08-24 12:07:06插入的测试数据1', 'wenchen10', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('108', '1081003', '1003', '2017-08-24 12:07:06插入的测试数据2', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('109', '1091003', '1003', '2017-08-24 12:07:07插入的测试数据3', 'hujintao', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('110', '1101003', '1003', '2017-08-24 12:07:07插入的测试数据4', 'wenchen3', '', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('111', '1111003', '1003', '2017-08-24 12:07:18插入的测试数据0', 'wenchen1112a', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('112', '1121003', '1003', '2017-08-24 12:07:18插入的测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('113', '1131003', '1003', '2017-08-24 12:07:19插入的测试数据2', 'gggg', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('114', '1141003', '1003', '2017-08-24 12:07:19插入的测试数据3', 'wenchen4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('115', '1151003', '1003', '2017-08-24 12:07:19插入的测试数据4', 'wenchen111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('116', '1161003', '1003', '2017-08-24 12:07:53插入的测试数据0', 'wenjiabao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('117', '1171003', '1003', '2017-08-24 12:07:53插入的测试数据1', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('118', '1181003', '1003', '2017-08-24 12:07:53插入的测试数据2', 'DSDS', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('119', '1191003', '1003', '2017-08-24 12:07:53插入的测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('120', '1201003', '1003', '2017-08-24 12:07:53插入的测试数据4', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('121', '1211003', '1003', '2017-08-24 12:08:28插入的测试数据0', 'wenchen3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('122', '1221003', '1003', '2017-08-24 12:08:28插入的测试数据1', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('123', '1231003', '1003', '2017-08-24 12:08:28插入的测试数据2', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('124', '1241003', '1003', '2017-08-24 12:08:28插入的测试数据3', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('125', '1251003', '1003', '2017-08-24 12:08:28插入的测试数据4', 'ds', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('126', '1261003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('127', '1271003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('128', '1281003', '1003', '2017-08-24 12:08:29插入的测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('129', '1291003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('130', '1301003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('131', '1311003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('132', '1321003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('133', '1331003', '1003', '2017-08-24 12:08:29插入的测试数据2', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('134', '1341003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('135', '1351003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'wenchen3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('136', '1361003', '1003', '2017-08-24 12:08:29插入的测试数据0', 'xijinping', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('137', '1371003', '1003', '2017-08-24 12:08:29插入的测试数据1', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('138', '1381003', '1003', '2017-08-24 12:08:29插入的测试数据2', '1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('139', '1391003', '1003', '2017-08-24 12:08:29插入的测试数据3', 'baba', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('140', '1401003', '1003', '2017-08-24 12:08:29插入的测试数据4', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('141', '1411003', '1003', '2017-08-24 12:09:04插入的测试数据0', 'wenchen1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('142', '1421003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('143', '1431003', '1003', '2017-08-24 12:09:05插入的测试数据2', 'sd', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('144', '1441003', '1003', '2017-08-24 12:09:05插入的测试数据3', 'DSDS', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('145', '1451003', '1003', '2017-08-24 12:09:05插入的测试数据4', 'wenchen111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', '');
INSERT INTO `j_news` VALUES ('146', '1461003', '1003', '2017-08-24 12:09:05插入的测试数据0', 'wenchen2', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('147', '1471003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('148', '1481003', '1003', '2017-08-24 12:09:05插入的测试数据2', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('149', '1491003', '1003', '2017-08-24 12:09:05插入的测试数据3', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('150', '1501003', '1003', '2017-08-24 12:09:05插入的测试数据4', 'wenchen8', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', '');
INSERT INTO `j_news` VALUES ('151', '1511003', '1003', '2017-08-24 12:09:05插入的测试数据0', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('152', '1521003', '1003', '2017-08-24 12:09:05插入的测试数据1', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('153', '1531003', '1003', '2017-08-24 12:09:06插入的测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('154', '1541003', '1003', '2017-08-24 12:09:06插入的测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('155', '1551003', '1003', '2017-08-24 12:09:06插入的测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', '');
INSERT INTO `j_news` VALUES ('156', '1561003', '1003', '2017-08-24 12:09:06插入的测试数据0', 'adasz', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('157', '1571003', '1003', '2017-08-24 12:09:06插入的测试数据1', 'ds', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('158', '1581003', '1003', '2017-08-24 12:09:06插入的测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('159', '1591003', '1003', '2017-08-24 12:09:06插入的测试数据3', 'ms', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('160', '1601003', '1003', '2017-08-24 12:09:06插入的测试数据4', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', '');
INSERT INTO `j_news` VALUES ('161', '1611003', '1003', '2017-08-24 12:09:26插入的测试数据0', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('162', '1621003', '1003', '2017-08-24 12:09:26插入的测试数据1', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('163', '1631003', '1003', '2017-08-24 12:09:26插入的测试数据2', 'wenchen10', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('164', '1641003', '1003', '2017-08-24 12:09:26插入的测试数据3', 'wenchen5', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('165', '1651003', '1003', '2017-08-24 12:09:26插入的测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('166', '1661003', '1003', '2017-08-24 12:10:13插入的大图文测试数据0', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('167', '1671003', '1003', '2017-08-24 12:10:13插入的大图文测试数据1', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('168', '1681003', '1003', '2017-08-24 12:10:13插入的大图文测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('169', '1691003', '1003', '2017-08-24 12:10:14插入的大图文测试数据3', 'dsdsdsa', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('170', '1701003', '1003', '2017-08-24 12:10:14插入的大图文测试数据4', 'wenchen11', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', '');
INSERT INTO `j_news` VALUES ('181', '1811003', '1003', '沃日你妈卖批哦', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/pic/4415fffb0ffc45e491c156962a15bcdd.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/html/4415fffb0ffc45e491c156962a15bcdd.html', '', '7', '');
INSERT INTO `j_news` VALUES ('182', '1821003', '1003', '我日日日日日日日你你你您妈妈妈妈吗', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/pic/8266bf8291984de2a5da9d7141074e92.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-30/html/8266bf8291984de2a5da9d7141074e92.html', '', '7', 0x3C7020636C6173733D223139223E3C7370616E3EE983A8E997A8E69893E88097E59381E7AEA1E79086E59198E5AFB9E69CACE983A8E997A8E7AEA1E79086E79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE983A8E997A8E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D2231392220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE9A696E58588E69FA5E8AFA2E8AFA5E794A8E688B7E698AFE590A6E698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC9A3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C7370616E3E73656C656374203C2F7370616E3E3C7370616E3E69643C2F7370616E3E3C7370616E3E266E6273703B66726F6D20635F7A63676C2077686572652061707069643D3F20616E64203C2F7370616E3E3C7370616E3E667A723D3F3C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3EE5A682E69E9CE4B8BAE7A9BAEFBC8CE5BCB9E587BAE5AFB9E8AF9DE6A186EFBC9AE682A8E4B88DE698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC8CE697A0E6B395E5AE8CE68890E799BBE8AEB0E5B7A5E4BD9CE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E435A424D5F49443C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC89E4B8BAE4B88AE99DA23C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E69643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE79A84E6938DE4BD9CE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E676574424D4C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E637A626D5F646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE68C81E69C89E983A8E997A8EFBC883C2F666F6E743E646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE695B0E9878FEFBC883C2F666F6E743E6E756D3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E342E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E7B1BBE59E8B3C2F666F6E743E3C2F7370616E3E3C7370616E3EEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D224D736F4E6F726D616C223E3C7370616E3E3C627220636C6561723D22616C6C223E3C2F7370616E3E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3E3C666F6E7420666163653D22E6A5B7E4BD93223EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E69FA5E8AFA2E7958CE99DA2E8AEBEE8AEA13C2F666F6E743E203C666F6E7420666163653D22E6A5B7E4BD93223EEFBC883C2F666F6E743E4C5948504C69737455493C666F6E7420666163653D22E6A5B7E4BD93223EEFBC893C2F666F6E743E3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C7370616E3EE5908EE58BA4E7AEA1E79086E59198E5AFB9E695B4E4B8AAE4BC81E4B89AE79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D2231392220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3EE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C2F7370616E3E3C7370616E3EE6938DE4BD9CE983A8E997A8EFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E585858583C2F666F6E743E3C2F7370616E3E3C7370616E3E266E6273703B266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8BEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223139223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223139223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223232223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E6765744C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E093C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575844657074436F6E74726F6C6C65722E717565727957584465707455493C666F6E7420666163653D22E4BBBFE5AE8B223EE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E983A8E997A8EFBC8CE5908CE697B6E5B086E8AFA5E983A8E997A8E58F8AE585B6E68980E69C89E5AD90E983A8E997A8E59D87E7AD9BE98089E587BAE69DA5E380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE38082E794A8E688B7E98089E68BA9E788B6E7B1BBE59E8BEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E);
INSERT INTO `j_news` VALUES ('183', '1831003', '1003', 'fdasfdfdfadsfdsf', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/b8ec5dfd148946daa95b4fb1db53ff47.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/b8ec5dfd148946daa95b4fb1db53ff47.html', '', '7', 0x3C7020636C6173733D223230223E3C7370616E3EE983A8E997A8E69893E88097E59381E7AEA1E79086E59198E5AFB9E69CACE983A8E997A8E7AEA1E79086E79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE983A8E997A8E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D2232302220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22363135222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223230223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E312E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E313032342A3630303C666F6E7420666163653D22E4BBBFE5AE8B223EE5AFB9E8AF9DE6A186EFBC8C3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E31353C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69DA1E8AEB0E5BD953C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E2F3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE9A1B5EFBC8CE5B185E4B8ADE380823C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E322E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE9A696E58588E69FA5E8AFA2E8AFA5E794A8E688B7E698AFE590A6E698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC9A3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223138223E3C7370616E3E73656C656374203C2F7370616E3E3C7370616E3E69643C2F7370616E3E3C7370616E3E266E6273703B66726F6D20635F7A63676C2077686572652061707069643D3F20616E64203C2F7370616E3E3C7370616E3E667A723D3F3C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3EE5A682E69E9CE4B8BAE7A9BAEFBC8CE5BCB9E587BAE5AFB9E8AF9DE6A186EFBC9AE682A8E4B88DE698AFE983A8E997A8E69893E88097E59381E7AEA1E79086E59198EFBC8CE697A0E6B395E5AE8CE68890E799BBE8AEB0E5B7A5E4BD9CE380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E332E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69FA5E8AFA23C2F666F6E743E565F4C5948503C666F6E7420666163653D22E4BBBFE5AE8B223EE8A786E59BBEEFBC8CE88EB7E5BE97E68C87E5AE9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E61707049643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E435A424D5F49443C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC89E4B8BAE4B88AE99DA23C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E69643C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE79A84E6938DE4BD9CE58897E8A1A8E380823C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E676574424D4C5948504C6973743C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE983A8E997A8EFBC883C2F666F6E743E637A626D5F646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE68C81E69C89E983A8E997A8EFBC883C2F666F6E743E646570745F6E616D653C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE695B0E9878FEFBC883C2F666F6E743E6E756D3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E342E266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE98089EFBC9A3C2F666F6E743E676574424D4C5948504C6973743C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE6938DE4BD9CE4BABAEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E575855736572436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E717565727957585573657255493C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3EE6938DE4BD9CE7B1BBE59E8BEFBC9A3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE4B88BE68B89E58897E8A1A8E6A1863C2F666F6E743E3C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EEFBC8CE9BB98E8AEA4E4B8BAE7A9BAEFBC8CE58C85E68BACE585A8E983A8E380823C2F666F6E743E594850435A4C58536572766963652E676574435A4C58436F6D626F57697468416C6C3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223137223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3E6C266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9AE6909CE7B4A2E6A186EFBC8CE9BB98E8AEA4E4B8BAE7A9BAE380823C2F666F6E743E5948504C58436F6E74726F6C6C65722E3C2F7370616E3E3C7370616E3E71756572795968706C7855493C2F7370616E3E3C7370616E3EE380823C2F7370616E3E3C7370616E3E3C666F6E7420666163653D22E4BBBFE5AE8B223EE794A8E688B7E98089E68BA9E788B6E7B1BBE59E8B3C2F666F6E743E3C2F7370616E3E3C7370616E3EEFBC8CE5B086E8AFA5E7B1BBE59E8BE58F8AE585B6E5AD90E7B1BBE59E8BE5AFB9E5BA94E79A84E69893E88097E59381E983BDE689BEE587BAE69DA5E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223136223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D224D736F4E6F726D616C223E3C7370616E3E3C627220636C6561723D22616C6C223E3C2F7370616E3E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223139223E3C212D2D5B69662021737570706F72744C697374735D2D2D3E3C7370616E3EC398266E6273703B3C2F7370616E3E3C212D2D5B656E6469665D2D2D3E3C623E3C7370616E3E3C666F6E7420666163653D22E6A5B7E4BD93223EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E69FA5E8AFA2E7958CE99DA2E8AEBEE8AEA13C2F666F6E743E203C666F6E7420666163653D22E6A5B7E4BD93223EEFBC883C2F666F6E743E4C5948504C69737455493C666F6E7420666163653D22E6A5B7E4BD93223EEFBC893C2F666F6E743E3C2F7370616E3E3C2F623E3C623E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F623E3C2F703E3C7020636C6173733D223230223E3C7370616E3EE5908EE58BA4E7AEA1E79086E59198E5AFB9E695B4E4B8AAE4BC81E4B89AE79A84E69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E8BF9BE8A18CE69FA5E8AFA2E380823C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F66343431306634336663333934313066626533336563373462323335366665302E6A70672220616C743D226E756C6C223E3C2F7370616E3E3C2F703E3C7461626C6520636C6173733D224D736F4E6F726D616C5461626C65206C617975692D7461626C652220616C69676E3D2263656E746572223E3C74626F64793E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE4BC81E4B89AE69893E88097E59381E587BAE585A5E5BA93E8AEB0E5BD95E58897E8A1A83C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D2232302220616C69676E3D22726967687422207374796C653D22746578742D616C69676E3A2072696768743B223E3C7370616E3EE6938DE4BD9CE4BABAEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C2F7370616E3E3C7370616E3EE6938DE4BD9CE983A8E997A8EFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E585858583C2F666F6E743E3C2F7370616E3E3C7370616E3E266E6273703B266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8BEFBC9A3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE69893E88097E59381E7B1BBE59E8BEFBC9A3C2F666F6E743E3C666F6E7420666163653D2254696D6573204E657720526F6D616E223E5858585820266E6273703B266E6273703B3C2F666F6E743E3C666F6E7420666163653D22E4BBBFE5AE8B223EE7AD9BE980893C2F666F6E743E3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C74723E3C74642077696474683D22353737222076616C69676E3D22746F70223E3C7020636C6173733D223230223E3C7370616E3EE6938DE4BD9CE4BABA20266E6273703B266E6273703BE6938DE4BD9CE983A8E997A820266E6273703B266E6273703BE6938DE4BD9CE7B1BBE59E8B20266E6273703B266E6273703BE68C81E69C89E983A8E997A820266E6273703B266E6273703BE69893E88097E59381E7B1BBE59E8B20266E6273703B266E6273703B266E6273703B266E6273703BE8A784E6A0BCE59E8BE58FB720266E6273703B266E6273703B266E6273703B266E6273703BE587BAE58E82E7BC96E58FB720266E6273703B266E6273703B266E6273703B266E6273703BE6938DE4BD9CE695B0E9878F203C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B3C2F7370616E3E3C2F703E3C7020636C6173733D223230223E3C7370616E3E266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B3C2F7370616E3E3C7370616E3E3C6F3A703E3C2F6F3A703E3C2F7370616E3E3C2F703E3C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('190', '20170831145310', '1003', 'okokokokokokokokoko', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/45984aa510454b3b92c451d63c6a72a3.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/45984aa510454b3b92c451d63c6a72a3.html', '', '7', 0x3C703E242E616A6178287B3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E75726C3A20676574436F6E74657874506174682829202B20222F61646D696E2F6474772F64656C4474772E646F222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E747970653A2022706F7374222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E646174613A7B7477646D3A647477736A55495F64656C526F772E646D7D2C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E64617461547970653A226A736F6E222C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E6173796E633A66616C73652C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E63616368653A66616C73652C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E737563636573733A66756E6374696F6E202872657329207B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E24282223647477736A55495F64676474774C69737422292E6461746167726964282772656C6F616427293B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E6966202821726573203D3D2022737563636573732229207B3C2F703E3C703E3C7370616E3E0909090909093C2F7370616E3E6C617965722E616C65727428726573756C742C7B7469746C653A27E58F91E7949FE4BA86E4B880E4B8AAE99499E8AFAF277D293B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E7D2C3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E6572726F723A66756E6374696F6E202829207B3C2F703E3C703E3C7370616E3E09090909093C2F7370616E3E616C6572742822416A6178206572726F722122293B3C2F703E3C703E3C7370616E3E090909093C2F7370616E3E7D3C2F703E3C703E3C7370616E3E0909093C2F7370616E3E7D293B3C2F703E3C703E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F38613437313035353762336234663362383539343735646633653834333737352E6A70672220616C743D226E756C6C223E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F32362E6769662220616C743D225BE680925D223E3C62723E3C2F703E);
INSERT INTO `j_news` VALUES ('191', '20170831145648', '1003', 'ppqqpajakjfalk', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/pic/ea8d185ef731427eb9045be123116056.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-08-31/html/ea8d185ef731427eb9045be123116056.html', '', '1', 0x3C703E6966202820726573756C74203D3D2022737563636573732229207B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E6C617965722E6D73672827E6938DE4BD9CE68890E58A9F272C7B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E09090909093C2F7370616E3E74696D653A20333030302C3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E09090909093C2F7370616E3E62746E3A5B27E79FA5E98193E595A6275D3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E7D293B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E0909093C2F7370616E3E7D20656C7365207B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E090909093C2F7370616E3E6C617965722E616C65727428726573756C742C7B7469746C653A27E58F91E7949FE4BA86E4B880E4B8AAE99499E8AFAF277D293B3C2F703E3C703E266E6273703B20266E6273703B203C7370616E3E093C2F7370616E3E203C7370616E3E0909093C2F7370616E3E7D3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F36352E6769662220616C743D225BE5A881E6ADA65D223E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F31342E6769662220616C743D225BE4BAB2E4BAB25D223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F6A732F6C617975692F696D616765732F666163652F32352E6769662220616C743D225BE68AB1E68AB15D223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F61646D696E5F3668612F74772F6474772F323031372D30382D33312F7069632F66393366353863316431613634383538386336353333313433653639383561622E6A70672220616C743D226E756C6C223E3C62723E3C2F703E);
INSERT INTO `j_news` VALUES ('192', '20170919101245', '1003', 'gdgkldl', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-19/pic/3da45935a9734bf19bf27790ee6c7d57.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-19/html/3da45935a9734bf19bf27790ee6c7d57.html', '', '3', 0x3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673EE4BA8BE4BBB6E5908D3C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE58F82E695B03C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE68F8FE8BFB03C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E4368616E67653C2F74643E0D0A3C74643E6E657756616C75652C206F6C6456616C75653C2F74643E0D0A3C74643EE59CA8E5AD97E6AEB5E580BCE69BB4E694B9E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E526573697A653C2F74643E0D0A3C74643E77696474682C206865696768743C2F74643E0D0A3C74643EE59CA8E69687E69CACE6A186E5A4A7E5B08FE694B9E58F98E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E436C69636B427574746F6E3C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE59CA8E794A8E688B7E782B9E587BBE68C89E992AEE79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E6F6E436C69636B49636F6E3C2F74643E0D0A3C74643E696E6465783C2F74643E0D0A3C74643EE59CA8E794A8E688B7E782B9E587BBE59BBEE6A087E79A84E697B6E58099E8A7A6E58F91E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E3C7020616C69676E3D226C656674223E203C2F703E3C683420616C69676E3D226C656674223EE696B9E6B3953C2F68343E3C7020616C69676E3D226C656674223EE696B9E6B395E689A9E5B195E887AA203C6120687265663D22223E76616C6964617465626F783C2F613EEFBC8CE4BBA5E4B88BE698AFE696B0E5A29EE79A84E69687E69CACE6A186E696B9E6B395E380823C2F703E3C703E0D0A0D0A0D0A0D0A3C2F703E3C7020616C69676E3D226C656674223E0D0A3C2F703E3C7461626C6520636C6173733D22646F632D7461626C65206C617975692D7461626C65222077696474683D22393525223E0D0A3C74626F64793E0D0A3C74723E0D0A3C74683E3C7374726F6E673EE696B9E6B395E5908D3C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE696B9E6B395E5B19EE680A73C2F7374726F6E673E3C2F74683E0D0A3C74683E3C7374726F6E673EE68F8FE8BFB03C2F7374726F6E673E3C2F74683E3C2F74723E0D0A3C74723E0D0A3C74643E6F7074696F6E733C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE5B19EE680A7E5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E74657874626F783C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE69687E69CACE6A186E5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E627574746F6E3C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE8BF94E59B9EE68C89E992AEE5AFB9E8B1A1E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E64657374726F793C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE99480E6AF81E69687E69CACE6A186E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E726573697A653C2F74643E0D0A3C74643E77696474683C2F74643E0D0A3C74643EE8B083E695B4E69687E69CACE6A186E7BB84E4BBB6E5AEBDE5BAA6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E64697361626C653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE7A681E794A8E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E656E61626C653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE590AFE794A8E7BB84E4BBB6E380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E726561646F6E6C793C2F74643E0D0A3C74643E6D6F64653C2F74643E0D0A3C74643EE590AFE794A82FE7A681E794A8E58FAAE8AFBBE6A8A1E5BC8FE38082200D0A3C703EE4BBA3E7A081E7A4BAE4BE8BEFBC9A3C2F703E3C7072653E24282723746227292E74657874626F782827726561646F6E6C7927293B09202020202020202020202020202020202F2F20E590AFE794A8E58FAAE8AFBBE6A8A1E5BC8F0D0A24282723746227292E74657874626F782827726561646F6E6C79272C74727565293B092F2F20E590AFE794A8E58FAAE8AFBBE6A8A1E5BC8F0D0A24282723746227292E74657874626F782827726561646F6E6C79272C66616C7365293B092F2F20E7A681E794A8E58FAAE8AFBBE6A8A1E5BC8F3C2F7072653E3C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E636C6561723C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE6B885E999A4E7BB84E4BBB6E4B8ADE79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E72657365743C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE9878DE7BDAEE7BB84E4BBB6E4B8ADE79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E736574546578743C2F74643E0D0A3C74643E746578743C2F74643E0D0A3C74643EE8AEBEE7BDAEE698BEE7A4BAE79A84E69687E69CACE580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E676574546578743C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE88EB7E58F96E698BEE7A4BAE79A84E69687E69CACE580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E73657456616C75653C2F74643E0D0A3C74643E76616C75653C2F74643E0D0A3C74643EE8AEBEE7BDAEE7BB84E4BBB6E79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E67657456616C75653C2F74643E0D0A3C74643E6E6F6E653C2F74643E0D0A3C74643EE88EB7E58F96E7BB84E4BBB6E79A84E580BCE380823C2F74643E3C2F74723E0D0A3C74723E0D0A3C74643E67657449636F6E3C2F74643E0D0A3C74643E696E6465783C2F74643E0D0A3C74643EE88EB7E58F96E68C87E5AE9AE59BBEE6A087E5AFB9E8B1A1E380823C2F74643E3C2F74723E3C2F74626F64793E3C2F7461626C653E);
INSERT INTO `j_news` VALUES ('194', '20170920102503', '1003', 'dsdsa', 'wenchen', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-20/pic/228c96dad49f47d7bd2b478c3441a743.jpg', 'http://localhost:8080/admin_6ha/tw/dtw/2017-09-20/html/228c96dad49f47d7bd2b478c3441a743.html', '', '1', 0x3C703E616D65776F726B2E6A6462632E64617461736F757263652E44617461536F757263655574696C735D202D2052657475726E696E67204A44424320436F6E6E656374696F6E20746F2044617461536F757263653C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E52657175657374526573706F6E7365426F64794D6574686F6450726F636573736F725D202D205772697474656E205B6F72672E6C662E7574696C732E45617379756944617461677269644032633732633230645D20617320226170706C69636174696F6E2F6A736F6E3B636861727365743D5554462D3822207573696E67205B6F72672E737072696E676672616D65776F726B2E687474702E636F6E7665727465722E6A736F6E2E4D617070696E674A61636B736F6E32487474704D657373616765436F6E7665727465724035366633623036615D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D204E756C6C204D6F64656C416E64566965772072657475726E656420746F2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643273A20617373756D696E672048616E646C65724164617074657220636F6D706C6574656420726571756573742068616E646C696E673C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D205375636365737366756C6C7920636F6D706C6574656420726571756573743C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643272070726F63657373696E6720474554207265717565737420666F72205B2F61646D696E5F3668612F61646D696E2F7477736A2F61646444747755492E646F5D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C65724D617070696E675D202D204C6F6F6B696E672075702068616E646C6572206D6574686F6420666F722070617468202F61646D696E2F7477736A2F61646444747755492E646F3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C65724D617070696E675D202D2052657475726E696E672068616E646C6572206D6574686F64205B7075626C6963206A6176612E6C616E672E537472696E67206F72672E6C662E61646D696E2E616374696F6E2E7477736A2E5457534A436F6E74726F6C6C65722E616464447477554928295D3C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E6265616E732E666163746F72792E737570706F72742E44656661756C744C69737461626C654265616E466163746F72795D202D2052657475726E696E672063616368656420696E7374616E6365206F662073696E676C65746F6E206265616E20275457534A436F6E74726F6C6C6572273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D204C6173742D4D6F6469666965642076616C756520666F72205B2F61646D696E5F3668612F61646D696E2F7477736A2F61646444747755492E646F5D2069733A202D313C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E6265616E732E666163746F72792E737570706F72742E44656661756C744C69737461626C654265616E466163746F72795D202D20496E766F6B696E6720616674657250726F706572746965735365742829206F6E206265616E2077697468206E616D65202761646D696E2F74772F7477736A2F6474772F6164644474775549273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D2052656E646572696E672076696577205B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4A73746C566965773A206E616D65202761646D696E2F74772F7477736A2F6474772F6164644474775549273B2055524C205B2F5745422D494E462F61646D696E2F74772F7477736A2F6474772F61646444747755492E6A73705D5D20696E2044697370617463686572536572766C65742077697468206E616D652027537072696E674D5643273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4A73746C566965775D202D20466F7277617264696E6720746F207265736F75726365205B2F5745422D494E462F61646D696E2F74772F7477736A2F6474772F61646444747755492E6A73705D20696E20496E7465726E616C5265736F7572636556696577202761646D696E2F74772F7477736A2F6474772F6164644474775549273C2F703E3C703E5B6F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65745D202D205375636365737366756C6C7920636F6D706C6574656420726571756573743C2F703E);
INSERT INTO `j_news` VALUES ('265', '1506135840487', '1002', '2017-09-23 11:04:00插入的小图文测试数据0', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('266', '1506135840575', '1002', '2017-09-23 11:04:00插入的小图文测试数据1', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('267', '1506135840636', '1002', '2017-09-23 11:04:00插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('268', '1506135840699', '1002', '2017-09-23 11:04:00插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('269', '1506135840769', '1002', '2017-09-23 11:04:00插入的小图文测试数据4', 'songhao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('270', '1506135841127', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'wenchen7', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('271', '1506135841194', '1002', '2017-09-23 11:04:01插入的小图文测试数据1', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('272', '1506135841250', '1002', '2017-09-23 11:04:01插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('273', '1506135841310', '1002', '2017-09-23 11:04:01插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('274', '1506135841366', '1002', '2017-09-23 11:04:01插入的小图文测试数据4', 'wenchen8', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '1', null);
INSERT INTO `j_news` VALUES ('275', '1506135841588', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('276', '1506135841641', '1002', '2017-09-23 11:04:01插入的小图文测试数据1', '1', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('277', '1506135841702', '1002', '2017-09-23 11:04:01插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('278', '1506135841758', '1002', '2017-09-23 11:04:01插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('279', '1506135841819', '1002', '2017-09-23 11:04:01插入的小图文测试数据4', 'weewq', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '5', null);
INSERT INTO `j_news` VALUES ('280', '1506135841926', '1002', '2017-09-23 11:04:01插入的小图文测试数据0', 'aqza', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('281', '1506135842002', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('282', '1506135842066', '1002', '2017-09-23 11:04:02插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('283', '1506135842127', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('284', '1506135842183', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'zhangjie', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '2', null);
INSERT INTO `j_news` VALUES ('285', '1506135842271', '1002', '2017-09-23 11:04:02插入的小图文测试数据0', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('286', '1506135842358', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('287', '1506135842419', '1002', '2017-09-23 11:04:02插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('288', '1506135842474', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'wenchen9', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('289', '1506135842536', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'likeqiang', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '6', null);
INSERT INTO `j_news` VALUES ('290', '1506135842615', '1002', '2017-09-23 11:04:02插入的小图文测试数据0', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('291', '1506135842702', '1002', '2017-09-23 11:04:02插入的小图文测试数据1', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('292', '1506135842758', '1002', '2017-09-23 11:04:02插入的小图文测试数据2', 'wenchen6', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('293', '1506135842844', '1002', '2017-09-23 11:04:02插入的小图文测试数据3', 'hujintao', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('294', '1506135842908', '1002', '2017-09-23 11:04:02插入的小图文测试数据4', 'wenchen12', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '4', null);
INSERT INTO `j_news` VALUES ('295', '1506135842991', '1002', '2017-09-23 11:04:02插入的小图文测试数据0', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('296', '1506135843049', '1002', '2017-09-23 11:04:03插入的小图文测试数据1', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('297', '1506135843136', '1002', '2017-09-23 11:04:03插入的小图文测试数据2', 'wenchen', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('298', '1506135843191', '1002', '2017-09-23 11:04:03插入的小图文测试数据3', 'wenchen1112a', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);
INSERT INTO `j_news` VALUES ('299', '1506135843252', '1002', '2017-09-23 11:04:03插入的小图文测试数据4', 'wenchen1111', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zNYcNnblwbbCaEe.jpg', 'http://news.17173.com/content/07292017/003105608.shtml', '', '7', null);

-- ----------------------------
-- Table structure for `j_pic`
-- ----------------------------
DROP TABLE IF EXISTS `j_pic`;
CREATE TABLE `j_pic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(255) DEFAULT NULL,
  `yxlx` varchar(255) DEFAULT NULL,
  `pic_lx` int(11) DEFAULT NULL COMMENT '用于区分图片的类型',
  `num` int(11) DEFAULT '0',
  `imgUrl` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_pic
-- ----------------------------
INSERT INTO `j_pic` VALUES ('80', '光明大陆', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qBSIPrblulrDrfs.jpg', 'http://news.17173.com/content/07272017/070031706_1.shtml');
INSERT INTO `j_pic` VALUES ('81', 'CS:GO', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/xXLDryblvFisjhn.jpg', 'http://csgo.17173.com/');
INSERT INTO `j_pic` VALUES ('82', '黑暗与光明', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EWExwObluliyCtF.jpg', 'http://newgame.17173.com/game-info-11565.html');
INSERT INTO `j_pic` VALUES ('83', '初音速', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NosIBYbluggCrAs.jpg', 'http://news.17173.com/content/07272017/100032462_1.shtml');
INSERT INTO `j_pic` VALUES ('84', '萌王EX', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/TINFTnbluggCrtc.jpg', 'http://newgame.17173.com/game-info-4044757.html');
INSERT INTO `j_pic` VALUES ('85', '黑色沙漠', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GzburGbluljeofh.jpg', 'http://news.17173.com/content/07272017/113313368.shtml');
INSERT INTO `j_pic` VALUES ('86', '终结者2：审判日', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FgDniAbluggCrsD.jpg', 'http://newgame.17173.com/game-info-4047622.html');
INSERT INTO `j_pic` VALUES ('87', '超凡战纪', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kxxYqvblvFhxlcq.jpg', 'http://newgame.17173.com/game-info-1000568.html');
INSERT INTO `j_pic` VALUES ('88', '梦想世界3D', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hgiAsMblvFhDygi.jpg', 'http://newgame.17173.com/game-info-4046388.html');
INSERT INTO `j_pic` VALUES ('89', '泰坦黎明', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FSSmLXbluggCpCp.jpg', 'http://news.17173.com/content/07282017/143808681.shtml');
INSERT INTO `j_pic` VALUES ('90', '神之物语', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yMXHAxblvFhAhkF.jpg', 'http://newgame.17173.com/game-info-4052206.html');
INSERT INTO `j_pic` VALUES ('91', '剑网3重置版', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/wTYCTebluljlyAx.jpg', 'http://news.17173.com/content/07272017/164043916.shtml');
INSERT INTO `j_pic` VALUES ('92', '传奇永恒', 'pc', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fvWRisblvFgjnaw.jpg', 'http://cqyh.17173.com/');
INSERT INTO `j_pic` VALUES ('93', '天启联盟', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qixMsrbluggCrBr.jpg', 'http://newgame.17173.com/game-info-4047431.html');
INSERT INTO `j_pic` VALUES ('94', '野良神：宿命', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/UuVMBtblwbmehyz.jpg', 'http://news.17173.com/content/07252017/095937018.shtml');
INSERT INTO `j_pic` VALUES ('95', '天堂2：誓言', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JIjOpoblugqqidj.jpg', 'http://newgame.17173.com/game-info-4048832.html');
INSERT INTO `j_pic` VALUES ('96', '我的恐龙GO', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yYSnESbluggCrta.jpg', 'http://newgame.17173.com/game-info-4047954.html');
INSERT INTO `j_pic` VALUES ('97', '拳皇命运', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/mEsbdsbluggCrsC.jpg', 'http://news.17173.com/content/07282017/165401495.shtml');
INSERT INTO `j_pic` VALUES ('98', '欢乐球吃球', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/OMGSRobluggCpEj.jpg', 'http://newgame.17173.com/game-info-4051945.html');
INSERT INTO `j_pic` VALUES ('99', '诛仙手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WWElRxblwdnAljp.jpg', 'http://newgame.17173.com/game-info-4042741.html');
INSERT INTO `j_pic` VALUES ('100', '石器时代手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QGgeOubluggCpzr.jpg', 'http://news.17173.com/content/07272017/152112174_1.shtml');
INSERT INTO `j_pic` VALUES ('101', '神无月', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eBNBewbluggCrta.jpg', 'http://news.17173.com/content/07302017/071153899.shtml');
INSERT INTO `j_pic` VALUES ('102', '第五人格', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/alPAIdbluggCrta.jpg', 'http://newgame.17173.com/game-info-4051732.html');
INSERT INTO `j_pic` VALUES ('103', '轩辕剑手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NAQrdnbluggCpta.jpg', 'http://newgame.17173.com/game-info-4051816.html');
INSERT INTO `j_pic` VALUES ('104', '轮回诀', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kczjLKbluggCpvc.jpg', 'http://news.17173.com/content/07292017/130529787_1.shtml');
INSERT INTO `j_pic` VALUES ('105', '黑暗与光明手游', 'phone', '1', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kAnkiQbluggCpuv.jpg', 'http://news.17173.com/content/07292017/140305892.shtml');
INSERT INTO `j_pic` VALUES ('106', null, null, '2', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/iulmWWblwivatvm.gif', 'http://news.17173.com/content/07302017/014000966_1.shtml');
INSERT INTO `j_pic` VALUES ('107', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SXCJJwblwgaAnuw.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml');
INSERT INTO `j_pic` VALUES ('108', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nftHyCblwgaBiBv.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml');
INSERT INTO `j_pic` VALUES ('109', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EnmluUblwgbhBzF.gif', 'http://news.17173.com/content/07292017/015958867_6.shtml');
INSERT INTO `j_pic` VALUES ('110', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GWikKlblwgbjbBs.gif', 'http://news.17173.com/content/07292017/015958867_4.shtml');
INSERT INTO `j_pic` VALUES ('111', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jckWTxblwgcwCwB.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml');
INSERT INTO `j_pic` VALUES ('112', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pwpuXgblwgcxvCo.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml');
INSERT INTO `j_pic` VALUES ('113', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/KhnYlpblwgdajwC.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml');
INSERT INTO `j_pic` VALUES ('114', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gTWLYablwgcyBdc.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml');
INSERT INTO `j_pic` VALUES ('115', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yxKFndblwgbkiEm.gif', 'http://news.17173.com/content/07292017/015958867_2.shtml');
INSERT INTO `j_pic` VALUES ('116', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pJLhwCblwgbnywc.gif', 'http://news.17173.com/content/07292017/015958867_7.shtml');
INSERT INTO `j_pic` VALUES ('117', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/lVgBBKblwgbrdAn.gif', 'http://news.17173.com/content/07292017/015958867_8.shtml');
INSERT INTO `j_pic` VALUES ('118', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WkUEKPblwgbuxmq.gif', 'http://news.17173.com/content/07292017/015958867_10.shtml');
INSERT INTO `j_pic` VALUES ('119', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/LyRrHxblwdrgAFz.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml');
INSERT INTO `j_pic` VALUES ('120', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zcMuMeblwdrulqp.gif', 'http://news.17173.com/content/07282017/013056606_12.shtml');
INSERT INTO `j_pic` VALUES ('121', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XTRVQyblwdrBizp.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml');
INSERT INTO `j_pic` VALUES ('122', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AaGQzNblwdsdflo.gif', 'http://news.17173.com/content/07282017/013056606_11.shtml');
INSERT INTO `j_pic` VALUES ('123', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/uYuXrTblwivoubs.gif', 'http://news.17173.com/content/07302017/014000966_3.shtml');
INSERT INTO `j_pic` VALUES ('124', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fsLXIVblwivjioq.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml');
INSERT INTO `j_pic` VALUES ('125', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WJoAAzblwivfAqE.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml');
INSERT INTO `j_pic` VALUES ('126', null, null, '3', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/apKNLOblwdtezgz.gif', 'http://news.17173.com/content/07282017/013056606_10.shtml');
INSERT INTO `j_pic` VALUES ('127', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hxXxvpblwcpqDbg.jpg', 'http://news.17173.com/content/07272017/215124983_1.shtml');
INSERT INTO `j_pic` VALUES ('128', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QJYArRblwoqafza.jpg', 'http://news.17173.com/content/07312017/151624373_4.shtml');
INSERT INTO `j_pic` VALUES ('129', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/akypJsblwmejxaF.jpg', 'http://news.17173.com/content/07312017/151624373_2.shtml');
INSERT INTO `j_pic` VALUES ('130', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/BeTVGlblwmekCyd.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml');
INSERT INTO `j_pic` VALUES ('131', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qCkCaJblwmeitpg.jpg', 'http://news.17173.com/content/07312017/151624373_1.shtml');
INSERT INTO `j_pic` VALUES ('132', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/Xulcxrblwmepfjv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml');
INSERT INTO `j_pic` VALUES ('133', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dKzSXPblwmemadA.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml');
INSERT INTO `j_pic` VALUES ('134', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GUYApQblwmeqsmf.jpg', 'http://news.17173.com/content/07312017/151624373_7.shtml');
INSERT INTO `j_pic` VALUES ('135', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eilXkYblwmeoamv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml');
INSERT INTO `j_pic` VALUES ('136', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cuECOeblwfFewcB.jpg', 'http://news.17173.com/content/07292017/002210788_5.shtml');
INSERT INTO `j_pic` VALUES ('137', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aYhGXeblwfFBFFr.jpg', 'http://news.17173.com/content/07292017/023153162_4.shtml');
INSERT INTO `j_pic` VALUES ('138', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/immzzbblwbptuyo.jpg', 'http://news.17173.com/content/07272017/142306104_1.shtml');
INSERT INTO `j_pic` VALUES ('139', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/PxzJvrblwfFuEFB.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml');
INSERT INTO `j_pic` VALUES ('140', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JbBhydblwfFislu.jpg', 'http://news.17173.com/content/07292017/002210788_6.shtml');
INSERT INTO `j_pic` VALUES ('141', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cLROCTblwfFlkpw.jpg', 'http://news.17173.com/content/07292017/002210788_1.shtml');
INSERT INTO `j_pic` VALUES ('142', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eGwaxcblwgdqijD.jpg', 'http://news.17173.com/content/07282017/230846744_1.shtml');
INSERT INTO `j_pic` VALUES ('143', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QtONuCblwgdrxil.jpg', 'http://news.17173.com/content/07282017/230846744_2.shtml');
INSERT INTO `j_pic` VALUES ('144', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pOBrFXblwgdtlkp.jpg', 'http://news.17173.com/content/07282017/230846744_3.shtml');
INSERT INTO `j_pic` VALUES ('145', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jmbezFblwgdyjDs.jpg', 'http://news.17173.com/content/07282017/230846744_4.shtml');
INSERT INTO `j_pic` VALUES ('146', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/DKApYoblwgdAoiu.jpg', 'http://news.17173.com/content/07282017/230846744_6');
INSERT INTO `j_pic` VALUES ('147', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pfXsSkblwfFmmfq.jpg', 'http://news.17173.com/content/07292017/002210788_2.shtml');
INSERT INTO `j_pic` VALUES ('148', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nAUOlAblwfFpjto.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml');
INSERT INTO `j_pic` VALUES ('149', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WmnuJCblwcpyCEs.jpg', 'http://news.17173.com/content/07272017/165956729_6.shtml');
INSERT INTO `j_pic` VALUES ('150', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dqxWezblwfFwEak.jpg', 'http://news.17173.com/content/07292017/002210788_9.shtml');
INSERT INTO `j_pic` VALUES ('151', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aMHAFkblwcpsAbz.jpg', 'http://news.17173.com/content/07272017/215124983_2.shtml');
INSERT INTO `j_pic` VALUES ('152', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GoeNsNblwcpFehv.jpg', 'http://news.17173.com/content/07272017/165956729_7.shtml');
INSERT INTO `j_pic` VALUES ('153', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XvKCbcblwbpyupl.jpg', 'http://news.17173.com/content/07272017/104851923_3.shtml');
INSERT INTO `j_pic` VALUES ('154', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NtPaWablwbpBkCa.jpg', 'http://news.17173.com/content/07272017/104851923_7.shtml');
INSERT INTO `j_pic` VALUES ('155', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gDygbyblwbpCynn.jpg', 'http://news.17173.com/content/07272017/104851923_9.shtml');
INSERT INTO `j_pic` VALUES ('156', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/VMDugAblwbpEcEg.jpg', 'http://news.17173.com/content/07272017/104851923_11.shtml');
INSERT INTO `j_pic` VALUES ('157', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/rKJLVDblvFByaCe.png', 'http://news.17173.com/content/07242017/162505854_1.shtml');
INSERT INTO `j_pic` VALUES ('158', null, null, '4', '0', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FwANVQblvFBBgoC.png', 'http://news.17173.com/content/07242017/162505854_6.shtml');

-- ----------------------------
-- Table structure for `j_tp`
-- ----------------------------
DROP TABLE IF EXISTS `j_tp`;
CREATE TABLE `j_tp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lx` int(2) DEFAULT NULL COMMENT '这里用到的是枚举类TPLX中的值',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '游戏的图片链接',
  `href` varchar(255) DEFAULT NULL COMMENT '游戏专题报道的链接',
  `zt` int(2) DEFAULT NULL COMMENT '图片状态，这里用枚举类XWZT中的值',
  `remark` varchar(255) DEFAULT NULL COMMENT '图片说明，在审批的时候要用到',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_tp
-- ----------------------------
INSERT INTO `j_tp` VALUES ('1', '2', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/iulmWWblwivatvm.gif', 'http://news.17173.com/content/07302017/014000966_1.shtml', null, null);
INSERT INTO `j_tp` VALUES ('2', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/SXCJJwblwgaAnuw.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml', null, null);
INSERT INTO `j_tp` VALUES ('3', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nftHyCblwgaBiBv.gif', 'http://news.17173.com/content/07292017/015958867_1.shtml', null, null);
INSERT INTO `j_tp` VALUES ('4', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EnmluUblwgbhBzF.gif', 'http://news.17173.com/content/07292017/015958867_6.shtml', null, null);
INSERT INTO `j_tp` VALUES ('5', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GWikKlblwgbjbBs.gif', 'http://news.17173.com/content/07292017/015958867_4.shtml', null, null);
INSERT INTO `j_tp` VALUES ('6', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jckWTxblwgcwCwB.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml', null, null);
INSERT INTO `j_tp` VALUES ('7', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pwpuXgblwgcxvCo.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml', null, null);
INSERT INTO `j_tp` VALUES ('8', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/KhnYlpblwgdajwC.gif', 'http://news.17173.com/content/07292017/015958867_13.shtml', null, null);
INSERT INTO `j_tp` VALUES ('9', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gTWLYablwgcyBdc.gif', 'http://news.17173.com/content/07292017/015958867_12.shtml', null, null);
INSERT INTO `j_tp` VALUES ('10', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yxKFndblwgbkiEm.gif', 'http://news.17173.com/content/07292017/015958867_2.shtml', null, null);
INSERT INTO `j_tp` VALUES ('11', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pJLhwCblwgbnywc.gif', 'http://news.17173.com/content/07292017/015958867_7.shtml', null, null);
INSERT INTO `j_tp` VALUES ('12', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/lVgBBKblwgbrdAn.gif', 'http://news.17173.com/content/07292017/015958867_8.shtml', null, null);
INSERT INTO `j_tp` VALUES ('13', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WkUEKPblwgbuxmq.gif', 'http://news.17173.com/content/07292017/015958867_10.shtml', null, null);
INSERT INTO `j_tp` VALUES ('14', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/LyRrHxblwdrgAFz.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml', null, null);
INSERT INTO `j_tp` VALUES ('15', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/zcMuMeblwdrulqp.gif', 'http://news.17173.com/content/07282017/013056606_12.shtml', null, null);
INSERT INTO `j_tp` VALUES ('16', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XTRVQyblwdrBizp.gif', 'http://news.17173.com/content/07282017/013056606_3.shtml', null, null);
INSERT INTO `j_tp` VALUES ('17', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/AaGQzNblwdsdflo.gif', 'http://news.17173.com/content/07282017/013056606_11.shtml', null, null);
INSERT INTO `j_tp` VALUES ('18', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/uYuXrTblwivoubs.gif', 'http://news.17173.com/content/07302017/014000966_3.shtml', null, null);
INSERT INTO `j_tp` VALUES ('19', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fsLXIVblwivjioq.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml', null, null);
INSERT INTO `j_tp` VALUES ('20', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WJoAAzblwivfAqE.gif', 'http://news.17173.com/content/07302017/014000966_2.shtml', null, null);
INSERT INTO `j_tp` VALUES ('21', '3', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/apKNLOblwdtezgz.gif', 'http://news.17173.com/content/07282017/013056606_10.shtml', null, null);
INSERT INTO `j_tp` VALUES ('22', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hxXxvpblwcpqDbg.jpg', 'http://news.17173.com/content/07272017/215124983_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('23', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QJYArRblwoqafza.jpg', 'http://news.17173.com/content/07312017/151624373_4.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('24', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/akypJsblwmejxaF.jpg', 'http://news.17173.com/content/07312017/151624373_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('25', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/BeTVGlblwmekCyd.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('26', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qCkCaJblwmeitpg.jpg', 'http://news.17173.com/content/07312017/151624373_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('27', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/Xulcxrblwmepfjv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('28', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dKzSXPblwmemadA.jpg', 'http://news.17173.com/content/07312017/151624373_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('29', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GUYApQblwmeqsmf.jpg', 'http://news.17173.com/content/07312017/151624373_7.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('30', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eilXkYblwmeoamv.jpg', 'http://news.17173.com/content/07312017/151624373_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('31', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cuECOeblwfFewcB.jpg', 'http://news.17173.com/content/07292017/002210788_5.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('32', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aYhGXeblwfFBFFr.jpg', 'http://news.17173.com/content/07292017/023153162_4.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('33', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/immzzbblwbptuyo.jpg', 'http://news.17173.com/content/07272017/142306104_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('34', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/PxzJvrblwfFuEFB.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('35', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JbBhydblwfFislu.jpg', 'http://news.17173.com/content/07292017/002210788_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('36', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/cLROCTblwfFlkpw.jpg', 'http://news.17173.com/content/07292017/002210788_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('37', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eGwaxcblwgdqijD.jpg', 'http://news.17173.com/content/07282017/230846744_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('38', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QtONuCblwgdrxil.jpg', 'http://news.17173.com/content/07282017/230846744_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('39', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pOBrFXblwgdtlkp.jpg', 'http://news.17173.com/content/07282017/230846744_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('40', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/jmbezFblwgdyjDs.jpg', 'http://news.17173.com/content/07282017/230846744_4.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('41', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/DKApYoblwgdAoiu.jpg', 'http://news.17173.com/content/07282017/230846744_6', '3', null);
INSERT INTO `j_tp` VALUES ('42', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/pfXsSkblwfFmmfq.jpg', 'http://news.17173.com/content/07292017/002210788_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('43', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/nAUOlAblwfFpjto.jpg', 'http://news.17173.com/content/07292017/002210788_8.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('44', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WmnuJCblwcpyCEs.jpg', 'http://news.17173.com/content/07272017/165956729_6.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('45', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/dqxWezblwfFwEak.jpg', 'http://news.17173.com/content/07292017/002210788_9.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('46', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/aMHAFkblwcpsAbz.jpg', 'http://news.17173.com/content/07272017/215124983_2.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('47', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GoeNsNblwcpFehv.jpg', 'http://news.17173.com/content/07272017/165956729_7.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('48', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/XvKCbcblwbpyupl.jpg', 'http://news.17173.com/content/07272017/104851923_3.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('49', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NtPaWablwbpBkCa.jpg', 'http://news.17173.com/content/07272017/104851923_7.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('50', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/gDygbyblwbpCynn.jpg', 'http://news.17173.com/content/07272017/104851923_9.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('51', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/VMDugAblwbpEcEg.jpg', 'http://news.17173.com/content/07272017/104851923_11.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('52', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/rKJLVDblvFByaCe.png', 'http://news.17173.com/content/07242017/162505854_1.shtml', '3', null);
INSERT INTO `j_tp` VALUES ('53', '4', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FwANVQblvFBBgoC.png', 'http://news.17173.com/content/07242017/162505854_6.shtml', '3', null);

-- ----------------------------
-- Table structure for `j_yx`
-- ----------------------------
DROP TABLE IF EXISTS `j_yx`;
CREATE TABLE `j_yx` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lx` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '游戏的名字',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '游戏的图片链接',
  `href` varchar(255) DEFAULT NULL COMMENT '游戏专题报道的链接',
  `count` int(11) DEFAULT NULL COMMENT '点赞的数量',
  `zt` int(2) DEFAULT NULL COMMENT '游戏状态，这里用枚举类XWZT中的值',
  `remark` varchar(255) DEFAULT NULL COMMENT '游戏说明，在审批的时候要用到',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of j_yx
-- ----------------------------
INSERT INTO `j_yx` VALUES ('1', 'phone', '光明大陆', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qBSIPrblulrDrfs.jpg', 'http://news.17173.com/content/07272017/070031706_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('2', 'pc', 'CS:GO', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/xXLDryblvFisjhn.jpg', 'http://csgo.17173.com/', '0', '3', null);
INSERT INTO `j_yx` VALUES ('3', 'pc', '黑暗与光明', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/EWExwObluliyCtF.jpg', 'http://newgame.17173.com/game-info-11565.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('4', 'phone', '初音速', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NosIBYbluggCrAs.jpg', 'http://news.17173.com/content/07272017/100032462_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('5', 'phone', '萌王EX', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/TINFTnbluggCrtc.jpg', 'http://newgame.17173.com/game-info-4044757.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('6', 'pc', '黑色沙漠', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/GzburGbluljeofh.jpg', 'http://news.17173.com/content/07272017/113313368.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('7', 'phone', '终结者2：审判日', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FgDniAbluggCrsD.jpg', 'http://newgame.17173.com/game-info-4047622.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('8', 'pc', '超凡战纪', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kxxYqvblvFhxlcq.jpg', 'http://newgame.17173.com/game-info-1000568.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('9', 'phone', '梦想世界3D', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/hgiAsMblvFhDygi.jpg', 'http://newgame.17173.com/game-info-4046388.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('10', 'phone', '泰坦黎明', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/FSSmLXbluggCpCp.jpg', 'http://news.17173.com/content/07282017/143808681.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('11', 'phone', '神之物语', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yMXHAxblvFhAhkF.jpg', 'http://newgame.17173.com/game-info-4052206.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('12', 'pc', '剑网3重置版', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/wTYCTebluljlyAx.jpg', 'http://news.17173.com/content/07272017/164043916.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('13', 'pc', '传奇永恒', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/fvWRisblvFgjnaw.jpg', 'http://cqyh.17173.com/', '0', '3', null);
INSERT INTO `j_yx` VALUES ('14', 'phone', '天启联盟', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/qixMsrbluggCrBr.jpg', 'http://newgame.17173.com/game-info-4047431.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('15', 'phone', '野良神：宿命', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/UuVMBtblwbmehyz.jpg', 'http://news.17173.com/content/07252017/095937018.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('16', 'phone', '天堂2：誓言', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/JIjOpoblugqqidj.jpg', 'http://newgame.17173.com/game-info-4048832.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('17', 'phone', '我的恐龙GO', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/yYSnESbluggCrta.jpg', 'http://newgame.17173.com/game-info-4047954.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('18', 'phone', '拳皇命运', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/mEsbdsbluggCrsC.jpg', 'http://news.17173.com/content/07282017/165401495.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('19', 'phone', '欢乐球吃球', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/OMGSRobluggCpEj.jpg', 'http://newgame.17173.com/game-info-4051945.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('20', 'phone', '诛仙手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/WWElRxblwdnAljp.jpg', 'http://newgame.17173.com/game-info-4042741.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('21', 'phone', '石器时代手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/QGgeOubluggCpzr.jpg', 'http://news.17173.com/content/07272017/152112174_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('22', 'phone', '神无月', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/eBNBewbluggCrta.jpg', 'http://news.17173.com/content/07302017/071153899.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('23', 'phone', '第五人格', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/alPAIdbluggCrta.jpg', 'http://newgame.17173.com/game-info-4051732.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('24', 'phone', '轩辕剑手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/NAQrdnbluggCpta.jpg', 'http://newgame.17173.com/game-info-4051816.html', '0', '3', null);
INSERT INTO `j_yx` VALUES ('25', 'phone', '轮回诀', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kczjLKbluggCpvc.jpg', 'http://news.17173.com/content/07292017/130529787_1.shtml', '0', '3', null);
INSERT INTO `j_yx` VALUES ('26', 'phone', '黑暗与光明手游', 'http://i.17173cdn.com/2fhnvk/YWxqaGBf/cms3/kAnkiQbluggCpuv.jpg', 'http://news.17173.com/content/07292017/140305892.shtml', '0', '3', null);

-- ----------------------------
-- Table structure for `l_news`
-- ----------------------------
DROP TABLE IF EXISTS `l_news`;
CREATE TABLE `l_news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dm` varchar(255) DEFAULT NULL COMMENT 'news对应在表中的dm',
  `czr` varchar(255) DEFAULT NULL COMMENT '操作人',
  `old_zt` int(11) DEFAULT NULL COMMENT '老状态',
  `new_zt` int(11) DEFAULT NULL COMMENT '新状态',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '操作说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of l_news
-- ----------------------------
INSERT INTO `l_news` VALUES ('1', '20170831145648', 'wenchen', null, '1', '2017-08-31 16:58:53', '大图文（20170831145648）于2017-08-31 16:58:53被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('2', '991003', 'wenchen', null, '1', '2017-08-31 16:59:16', '大图文（991003）于2017-08-31 16:59:16被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('3', '20170919101245', 'wenchen', null, '1', '2017-09-19 10:12:57', '大图文（20170919101245）于2017-09-19 10:12:57被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('4', '20170919114145', 'wenchen', null, '1', '2017-09-19 11:41:49', '大图文（20170919114145）于2017-09-19 11:41:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('5', '20170920102503', 'wenchen', null, '1', '2017-09-20 11:08:57', '大图文（20170920102503）于2017-09-20 11:08:57被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('6', '20170919114145', 'wenchen', null, '1', '2017-09-21 14:31:45', '大图文（20170919114145）于2017-09-21 14:31:45被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('7', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:23:55', '大图文(20170920102503)于2017-09-21 15:23:55被wenchen提交进行一审，现处于一审未通过状态，驳回原因：212121aasasaff地方大');
INSERT INTO `l_news` VALUES ('8', '20170831145648', 'wenchen', '1', '5', '2017-09-21 15:24:39', '大图文(20170831145648)于2017-09-21 15:24:39被wenchen提交进行一审，现处于一审未通过状态，驳回原因：的萨达大厦');
INSERT INTO `l_news` VALUES ('9', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:25:16', '大图文（20170920102503）于2017-09-21 15:25:16被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('10', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:25:27', '大图文(20170920102503)于2017-09-21 15:25:27被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大萨达');
INSERT INTO `l_news` VALUES ('11', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:27:18', '大图文(20170919114145)于2017-09-21 15:27:18被wenchen提交进行一审，现处于一审未通过状态，驳回原因：打算的撒打算');
INSERT INTO `l_news` VALUES ('12', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:27:55', '大图文（20170919114145）于2017-09-21 15:27:55被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('13', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:27:58', '大图文（20170920102503）于2017-09-21 15:27:58被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('14', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:28:05', '大图文(20170920102503)于2017-09-21 15:28:05被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大叔大婶');
INSERT INTO `l_news` VALUES ('15', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:28:18', '大图文(20170919114145)于2017-09-21 15:28:18被wenchen提交进行一审，现处于一审未通过状态，驳回原因：21121');
INSERT INTO `l_news` VALUES ('16', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:28:49', '大图文（20170920102503）于2017-09-21 15:28:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('17', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:28:49', '大图文（20170920102503）于2017-09-21 15:28:49被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('18', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:28:51', '大图文（20170919114145）于2017-09-21 15:28:51被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('19', '20170831145648', 'wenchen', null, '1', '2017-09-21 15:28:55', '大图文（20170831145648）于2017-09-21 15:28:55被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('20', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:29:03', '大图文(20170920102503)于2017-09-21 15:29:03被wenchen提交进行一审，现处于一审未通过状态，驳回原因：法萨芬地方都是');
INSERT INTO `l_news` VALUES ('21', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:29:36', '大图文(20170919114145)于2017-09-21 15:29:36被wenchen提交进行一审，现处于一审未通过状态，驳回原因：广发');
INSERT INTO `l_news` VALUES ('22', '20170831145648', 'wenchen', '1', '5', '2017-09-21 15:29:42', '大图文(20170831145648)于2017-09-21 15:29:42被wenchen提交进行一审，现处于一审未通过状态，驳回原因：打撒打撒');
INSERT INTO `l_news` VALUES ('23', '20170919114145', 'wenchen', null, '1', '2017-09-21 15:30:10', '大图文（20170919114145）于2017-09-21 15:30:10被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('24', '20170920102503', 'wenchen', null, '1', '2017-09-21 15:30:12', '大图文（20170920102503）于2017-09-21 15:30:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('25', '20170831145648', 'wenchen', null, '1', '2017-09-21 15:30:14', '大图文（20170831145648）于2017-09-21 15:30:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('26', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:30:22', '大图文(20170920102503)于2017-09-21 15:30:22被wenchen提交进行一审，现处于一审未通过状态，驳回原因：独山大道');
INSERT INTO `l_news` VALUES ('27', '20170919114145', 'wenchen', '1', '5', '2017-09-21 15:30:28', '大图文(20170919114145)于2017-09-21 15:30:28被wenchen提交进行一审，现处于一审未通过状态，驳回原因：大大是多少');
INSERT INTO `l_news` VALUES ('28', '20170831145648', 'wenchen', '1', '2', '2017-09-21 15:35:12', '大图文(20170831145648)于2017-09-21 15:35:12被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('29', '20170920102503', 'wenchen', '5', '1', '2017-09-21 15:40:42', '大图文（20170920102503）于2017-09-21 15:40:42被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('30', '20170919114145', 'wenchen', '5', '1', '2017-09-21 15:40:44', '大图文（20170919114145）于2017-09-21 15:40:44被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('31', '20170920102503', 'wenchen', '1', '5', '2017-09-21 15:40:59', '大图文(20170920102503)于2017-09-21 15:40:59被wenchen提交进行一审，现处于一审未通过状态，驳回原因：dsaasdasdas');
INSERT INTO `l_news` VALUES ('32', '20170919114145', 'wenchen', '1', '2', '2017-09-21 16:16:43', '大图文(20170919114145)于2017-09-21 16:16:43被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('33', '20170831145648', 'wenchen', '2', '6', '2017-09-21 16:25:47', '大图文(20170831145648)于2017-09-21 16:25:47被wenchen提交进行二审，现处于一审未通过状态，驳回原因：dasdasdas');
INSERT INTO `l_news` VALUES ('34', '20170831145648', 'wenchen', '6', '1', '2017-09-21 16:26:59', '大图文（20170831145648）于2017-09-21 16:26:59被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('35', '20170831145648', 'wenchen', '1', '5', '2017-09-21 16:27:06', '大图文(20170831145648)于2017-09-21 16:27:06被wenchen提交进行一审，现处于一审未通过状态，驳回原因：dsadsad');
INSERT INTO `l_news` VALUES ('36', '20170919114145', 'wenchen', '2', '3', '2017-09-21 16:32:44', '大图文(20170919114145)于2017-09-21 16:32:44被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('37', '131003', 'wenchen', '4', '1', '2017-09-21 16:40:10', '大图文（131003）于2017-09-21 16:40:10被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('38', '131003', 'wenchen', '1', '2', '2017-09-21 16:40:28', '大图文(131003)于2017-09-21 16:40:28被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('39', '131003', 'wenchen', '2', '3', '2017-09-21 16:44:40', '大图文(131003)于2017-09-21 16:44:40被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('40', '20170919114145', 'wenchen', '4', '1', '2017-09-21 16:50:12', '大图文（20170919114145）于2017-09-21 16:50:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('41', '20170919114145', 'wenchen', '1', '2', '2017-09-21 16:50:26', '大图文(20170919114145)于2017-09-21 16:50:26被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('42', '20170919114145', 'wenchen', '2', '3', '2017-09-21 16:50:37', '大图文(20170919114145)于2017-09-21 16:50:37被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('43', '131003', 'wenchen', '4', '1', '2017-09-21 17:03:14', '大图文（131003）于2017-09-21 17:03:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('44', '131003', 'wenchen', '1', '2', '2017-09-21 17:03:20', '大图文(131003)于2017-09-21 17:03:20被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('45', '131003', 'wenchen', '2', '3', '2017-09-21 17:03:26', '大图文(131003)于2017-09-21 17:03:26被提交，经wenchen审批通过，现处于上架中');
INSERT INTO `l_news` VALUES ('46', '20170920102503', 'wenchen', '5', '1', '2017-09-23 10:27:12', '大图文（20170920102503）于2017-09-23 10:27:12被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('47', '20170919114145', 'wenchen', '4', '1', '2017-09-23 10:27:14', '大图文（20170919114145）于2017-09-23 10:27:14被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('48', '20170831145648', 'wenchen', '5', '1', '2017-09-23 10:27:23', '大图文（20170831145648）于2017-09-23 10:27:23被提交，现处于一审中');
INSERT INTO `l_news` VALUES ('49', '20170919114145', 'wenchen', '1', '2', '2017-09-23 10:39:59', '大图文(20170919114145)于2017-09-23 10:39:59被提交，经wenchen审批通过，现处于二审中');
INSERT INTO `l_news` VALUES ('50', '20170919114145', 'wenchen', '2', '6', '2017-09-23 10:40:24', '大图文(20170919114145)于2017-09-23 10:40:24被wenchen提交进行二审，现处于二审未通过状态，驳回原因：caonimas');
INSERT INTO `l_news` VALUES ('51', '20170919101245', 'wenchen', '2', '3', '2017-09-23 10:41:18', '大图文(20170919101245)于2017-09-23 10:41:18被提交，经wenchen审批通过，现处于上架中');

-- ----------------------------
-- Table structure for `l_user_grade`
-- ----------------------------
DROP TABLE IF EXISTS `l_user_grade`;
CREATE TABLE `l_user_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `old_grade` int(11) DEFAULT NULL,
  `new_grade` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `czsj` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of l_user_grade
-- ----------------------------
INSERT INTO `l_user_grade` VALUES ('1', 'wenchen', '1', '1', '100', '2017-07-17');
INSERT INTO `l_user_grade` VALUES ('2', 'wenchen', '1', '1', '100', '2017-07-13');
INSERT INTO `l_user_grade` VALUES ('3', 'wenchen', '1', '2', '800', '2017-07-20');
INSERT INTO `l_user_grade` VALUES ('4', 'wenchen', '2', '2', '1000', '2017-07-18');
INSERT INTO `l_user_grade` VALUES ('5', 'wenchen', '2', '2', '1000', '2017-07-17');
INSERT INTO `l_user_grade` VALUES ('6', 'wenchen', '2', '2', '1000', '2018-01-01');
INSERT INTO `l_user_grade` VALUES ('7', 'wenchen', '2', '2', '1000', '2018-02-01');
INSERT INTO `l_user_grade` VALUES ('8', 'wenchen', '2', '2', '600', '2018-02-11');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(66) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mennu_icon` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('10', '系统管理', '/system', '', '0');
INSERT INTO `menu` VALUES ('20', '图文上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('30', '新闻上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('40', '图片上架', '/system', '', '0');
INSERT INTO `menu` VALUES ('50', '统计报表', '/system', '', '0');
INSERT INTO `menu` VALUES ('60', '详细资料 ', '/system', '', '0');
INSERT INTO `menu` VALUES ('101', '完善个人信息', '/admin/info/completeInfoUI.do', '', '10');
INSERT INTO `menu` VALUES ('102', '角色权限管理', '/admin/system/roleAuthoryUI.do', '', '10');
INSERT INTO `menu` VALUES ('103', '用户管理', '/admin/system/userCUI.do', '', '10');
INSERT INTO `menu` VALUES ('201', '小图文上架申请', '/admin/twsj/xtwsjUI.do', '', '20');
INSERT INTO `menu` VALUES ('202', '小图文上架初审', '/admin/twcs/xtwcsUI.do', '', '20');
INSERT INTO `menu` VALUES ('203', '小图文上架终审', '/admin/twzs/xtwzsUI.do', '', '20');
INSERT INTO `menu` VALUES ('204', '大图文上架申请', '/admin/twsj/dtwsjUI.do', '', '20');
INSERT INTO `menu` VALUES ('205', '大图文上架初审', '/admin/twcs/dtwcsUI.do', '', '20');
INSERT INTO `menu` VALUES ('206', '大图文上架终审', '/admin/twzs/dtwzsUI.do', '', '20');
INSERT INTO `menu` VALUES ('301', '日看点新闻上架申请', '/admin/rkdxw/rkdxwsjUI.do', '', '30');
INSERT INTO `menu` VALUES ('302', '日看点新闻初审', '/admin/rkdxw/rkdxwcsUI.do', '', '30');
INSERT INTO `menu` VALUES ('303', '日看点新闻终审', '/admin/rkdxw/rkdxwzsUI.do', '', '30');
INSERT INTO `menu` VALUES ('304', '滚动新闻上架申请', '/admin/gdxw/gdxwsjUI.do', '', '30');
INSERT INTO `menu` VALUES ('305', '滚动新闻初审', '/admin/gdxw/gdxwcsUI.do', '', '30');
INSERT INTO `menu` VALUES ('306', '滚动新闻终审', '/admin/gdxw/gdxwzsUI.do', '', '30');
INSERT INTO `menu` VALUES ('401', '普通图片上架申请', '/admin/pttp/pttpsjUI.do', '', '40');
INSERT INTO `menu` VALUES ('402', '普通图片初审', '/admin/pttp/pttpcsUI.do', '', '40');
INSERT INTO `menu` VALUES ('403', '普通图片终审', '/admin/pttp/pttpzsUI.do', '', '40');
INSERT INTO `menu` VALUES ('404', '动态图片上架申请', '/admin/dttp/dttpsjUI.do', '', '40');
INSERT INTO `menu` VALUES ('405', '动态图片初审', '/admin/dttp/dttpcsUI.do', '', '40');
INSERT INTO `menu` VALUES ('406', '动态图片终审', '/admin/dttp/dttpzsUI.do', '', '40');
INSERT INTO `menu` VALUES ('501', '会员充值统计', '/admin/count/countRechargeUI.do', '', '50');
INSERT INTO `menu` VALUES ('502', '新闻上架统计', '', '', '50');
INSERT INTO `menu` VALUES ('503', '图片上架统计', '', '', '50');
INSERT INTO `menu` VALUES ('601', '普通用户查询', '/admin/detail/userDetailUI.do', '', '60');
INSERT INTO `menu` VALUES ('602', 'VIP用户查询', '/admin/detail/vipDetailUI.do', '', '60');
INSERT INTO `menu` VALUES ('603', '管理员用户查询', '/admin/detail/adminDetailUI.do', '', '60');

-- ----------------------------
-- Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('28', '1', '10');
INSERT INTO `menu_role` VALUES ('29', '1', '101');
INSERT INTO `menu_role` VALUES ('30', '1', '20');
INSERT INTO `menu_role` VALUES ('31', '1', '201');
INSERT INTO `menu_role` VALUES ('32', '1', '202');
INSERT INTO `menu_role` VALUES ('33', '1', '30');
INSERT INTO `menu_role` VALUES ('34', '1', '301');
INSERT INTO `menu_role` VALUES ('35', '1', '302');
INSERT INTO `menu_role` VALUES ('36', '1', '40');
INSERT INTO `menu_role` VALUES ('37', '1', '401');
INSERT INTO `menu_role` VALUES ('38', '1', '402');
INSERT INTO `menu_role` VALUES ('39', '1', '50');
INSERT INTO `menu_role` VALUES ('40', '1', '502');
INSERT INTO `menu_role` VALUES ('41', '1', '503');
INSERT INTO `menu_role` VALUES ('42', '2', '10');
INSERT INTO `menu_role` VALUES ('43', '2', '101');
INSERT INTO `menu_role` VALUES ('44', '2', '20');
INSERT INTO `menu_role` VALUES ('45', '2', '201');
INSERT INTO `menu_role` VALUES ('46', '2', '202');
INSERT INTO `menu_role` VALUES ('47', '2', '203');
INSERT INTO `menu_role` VALUES ('48', '2', '204');
INSERT INTO `menu_role` VALUES ('49', '2', '30');
INSERT INTO `menu_role` VALUES ('50', '2', '301');
INSERT INTO `menu_role` VALUES ('51', '2', '302');
INSERT INTO `menu_role` VALUES ('52', '2', '303');
INSERT INTO `menu_role` VALUES ('53', '2', '304');
INSERT INTO `menu_role` VALUES ('54', '2', '40');
INSERT INTO `menu_role` VALUES ('55', '2', '401');
INSERT INTO `menu_role` VALUES ('56', '2', '402');
INSERT INTO `menu_role` VALUES ('57', '2', '403');
INSERT INTO `menu_role` VALUES ('58', '2', '404');
INSERT INTO `menu_role` VALUES ('59', '2', '50');
INSERT INTO `menu_role` VALUES ('60', '2', '502');
INSERT INTO `menu_role` VALUES ('61', '2', '503');
INSERT INTO `menu_role` VALUES ('62', '3', '10');
INSERT INTO `menu_role` VALUES ('63', '3', '101');
INSERT INTO `menu_role` VALUES ('64', '3', '20');
INSERT INTO `menu_role` VALUES ('65', '3', '201');
INSERT INTO `menu_role` VALUES ('66', '3', '202');
INSERT INTO `menu_role` VALUES ('67', '3', '203');
INSERT INTO `menu_role` VALUES ('68', '3', '204');
INSERT INTO `menu_role` VALUES ('69', '3', '30');
INSERT INTO `menu_role` VALUES ('70', '3', '301');
INSERT INTO `menu_role` VALUES ('71', '3', '302');
INSERT INTO `menu_role` VALUES ('72', '3', '303');
INSERT INTO `menu_role` VALUES ('73', '3', '304');
INSERT INTO `menu_role` VALUES ('74', '3', '40');
INSERT INTO `menu_role` VALUES ('75', '3', '401');
INSERT INTO `menu_role` VALUES ('76', '3', '402');
INSERT INTO `menu_role` VALUES ('77', '3', '403');
INSERT INTO `menu_role` VALUES ('78', '3', '404');
INSERT INTO `menu_role` VALUES ('79', '3', '50');
INSERT INTO `menu_role` VALUES ('80', '3', '502');
INSERT INTO `menu_role` VALUES ('81', '3', '503');
INSERT INTO `menu_role` VALUES ('82', '5', '10');
INSERT INTO `menu_role` VALUES ('83', '5', '101');
INSERT INTO `menu_role` VALUES ('84', '5', '20');
INSERT INTO `menu_role` VALUES ('85', '5', '201');
INSERT INTO `menu_role` VALUES ('86', '5', '202');
INSERT INTO `menu_role` VALUES ('87', '5', '203');
INSERT INTO `menu_role` VALUES ('88', '5', '204');
INSERT INTO `menu_role` VALUES ('89', '5', '30');
INSERT INTO `menu_role` VALUES ('90', '5', '301');
INSERT INTO `menu_role` VALUES ('91', '5', '302');
INSERT INTO `menu_role` VALUES ('92', '5', '303');
INSERT INTO `menu_role` VALUES ('93', '5', '304');
INSERT INTO `menu_role` VALUES ('94', '5', '40');
INSERT INTO `menu_role` VALUES ('95', '5', '401');
INSERT INTO `menu_role` VALUES ('96', '5', '402');
INSERT INTO `menu_role` VALUES ('97', '5', '403');
INSERT INTO `menu_role` VALUES ('98', '5', '404');
INSERT INTO `menu_role` VALUES ('99', '5', '50');
INSERT INTO `menu_role` VALUES ('100', '5', '502');
INSERT INTO `menu_role` VALUES ('101', '5', '503');
INSERT INTO `menu_role` VALUES ('102', '4', '10');
INSERT INTO `menu_role` VALUES ('103', '4', '20');
INSERT INTO `menu_role` VALUES ('104', '4', '30');
INSERT INTO `menu_role` VALUES ('105', '4', '40');
INSERT INTO `menu_role` VALUES ('106', '4', '50');
INSERT INTO `menu_role` VALUES ('107', '4', '60');
INSERT INTO `menu_role` VALUES ('108', '4', '101');
INSERT INTO `menu_role` VALUES ('109', '4', '102');
INSERT INTO `menu_role` VALUES ('110', '4', '103');
INSERT INTO `menu_role` VALUES ('111', '4', '201');
INSERT INTO `menu_role` VALUES ('112', '4', '202');
INSERT INTO `menu_role` VALUES ('113', '4', '203');
INSERT INTO `menu_role` VALUES ('114', '4', '204');
INSERT INTO `menu_role` VALUES ('115', '4', '205');
INSERT INTO `menu_role` VALUES ('116', '4', '206');
INSERT INTO `menu_role` VALUES ('117', '4', '301');
INSERT INTO `menu_role` VALUES ('118', '4', '302');
INSERT INTO `menu_role` VALUES ('119', '4', '303');
INSERT INTO `menu_role` VALUES ('120', '4', '304');
INSERT INTO `menu_role` VALUES ('121', '4', '305');
INSERT INTO `menu_role` VALUES ('122', '4', '306');
INSERT INTO `menu_role` VALUES ('123', '4', '401');
INSERT INTO `menu_role` VALUES ('124', '4', '402');
INSERT INTO `menu_role` VALUES ('125', '4', '403');
INSERT INTO `menu_role` VALUES ('126', '4', '404');
INSERT INTO `menu_role` VALUES ('127', '4', '405');
INSERT INTO `menu_role` VALUES ('128', '4', '406');
INSERT INTO `menu_role` VALUES ('129', '4', '501');
INSERT INTO `menu_role` VALUES ('130', '4', '502');
INSERT INTO `menu_role` VALUES ('131', '4', '503');
INSERT INTO `menu_role` VALUES ('132', '4', '601');
INSERT INTO `menu_role` VALUES ('133', '4', '602');
INSERT INTO `menu_role` VALUES ('134', '4', '603');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市');
INSERT INTO `province` VALUES ('2', '天津市');
INSERT INTO `province` VALUES ('3', '上海市');
INSERT INTO `province` VALUES ('4', '重庆市');
INSERT INTO `province` VALUES ('5', '河北省');
INSERT INTO `province` VALUES ('6', '山西省');
INSERT INTO `province` VALUES ('7', '辽宁省');
INSERT INTO `province` VALUES ('8', '吉林省');
INSERT INTO `province` VALUES ('9', '黑龙江省');
INSERT INTO `province` VALUES ('10', '江苏省');
INSERT INTO `province` VALUES ('11', '浙江省');
INSERT INTO `province` VALUES ('12', '安徽省');
INSERT INTO `province` VALUES ('13', '福建省');
INSERT INTO `province` VALUES ('14', '江西省');
INSERT INTO `province` VALUES ('15', '山东省');
INSERT INTO `province` VALUES ('16', '河南省');
INSERT INTO `province` VALUES ('17', '湖北省');
INSERT INTO `province` VALUES ('18', '湖南省');
INSERT INTO `province` VALUES ('19', '广东省');
INSERT INTO `province` VALUES ('20', '海南省');
INSERT INTO `province` VALUES ('21', '四川省');
INSERT INTO `province` VALUES ('22', '贵州省');
INSERT INTO `province` VALUES ('23', '云南省');
INSERT INTO `province` VALUES ('24', '山西省');
INSERT INTO `province` VALUES ('25', '甘肃省');
INSERT INTO `province` VALUES ('26', '青海省');
INSERT INTO `province` VALUES ('27', '台湾');
INSERT INTO `province` VALUES ('28', '内蒙古自治区');
INSERT INTO `province` VALUES ('29', '广西壮族自治区');
INSERT INTO `province` VALUES ('30', '西藏自治区');
INSERT INTO `province` VALUES ('31', '宁夏回族自治区');
INSERT INTO `province` VALUES ('32', '新疆维吾尔族自治区');
INSERT INTO `province` VALUES ('33', '香港特别行政区');
INSERT INTO `province` VALUES ('34', '澳门特别行政区');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '编辑');
INSERT INTO `role` VALUES ('2', '助理编辑');
INSERT INTO `role` VALUES ('3', '主任助理');
INSERT INTO `role` VALUES ('4', '超级管理员');
INSERT INTO `role` VALUES ('5', '主任编辑');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `uname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'password=toMD5(uname+密码)',
  `petname` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `age` int(11) DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否已经实名认证',
  `role` int(11) DEFAULT '0' COMMENT '角色类别',
  `groupId` int(11) DEFAULT '1' COMMENT '存放充值的总数',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'bbc994a0b6ac4c429c4b8f728b564fb2', '1', 'EEAFB716F93FA090D7716749A6EEFA72', 'W', '女', '22', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('2', 'fd63cf85ce7e4dabb509b76c6ae5b4dd', 'adasz', 'A378B43D8274631937EF177ACC059E6B', '111111', '男', '111', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('3', 'f3ef30f19db54b938a8813d548925a24', 'aqza', '1648638715E7B400F095E289A742B9B2', '11d', '男', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('4', '2f45c38763134f19b6c059bb0228c8c6', 'baba', 'F5387BA251B44DCC13632C1332BB716B', 'adfhu', '男', '21', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('5', '2d1be9a4a03941859d05a7bfb1e48c20', 'ds', 'BD9513C84A91C74B5F4415F95EF0F5F6', 'ds', '男', '1', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('6', '4ac49afbffbf4d8eb453e43fe5892ee6', 'dsd111', 'DCB887576796CEF76A8170388522B4AE', 'adss', '男', '12', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('7', '333e8d9c54ca44cf9b5d211ef7459253', 'DSDS', '4E005ADF36F296E7CA9B8EBF691022D6', 'AAA', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('8', 'ab0fe617861048a3991fa570d0533635', 'dsdsdsa', '0581A8E9CBCB79C5F1467F7F594EB8A9', '1121', '女', '1', '', '', '0', '3', '1');
INSERT INTO `user` VALUES ('9', '3dcb33a348d0447aa0dcdc31e4be9fc4', 'gggg', '805ED5716B31F26945DEDE70CDDB2405', '1121', '男', '43', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('10', '7a680e0b79f64f8aa960a733671cf491', 'hujintao', 'CEC0137264611F7999CD23E8B5767CCC', '胡进涛', '男', '50', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('11', 'd61d7a402295476c82a356bfe2499ab2', 'likeqiang', '53D3160DA5549040B367C934FA00EF4E', '李克强', '男', '50', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('12', 'aa70e35a0dad4c1ebcd3bb13b551213c', 'ms', '3376EC73E91EBD975D2AFFD02B68A262', '秘书', '女', '20', '', '', '0', '3', '1');
INSERT INTO `user` VALUES ('13', '90c22d6ce66a423eb8f18fa1a900d7e3', 'qwqwq', 'CE5D4F6CD3922D084A22DDC25DEF9FF9', '112as', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('14', '6a2425d9e6a84359a8cdb334d7536ce6', 'sd', 'D766EFB1DFCF3373895112F9C936D620', '1', '男', '1', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('15', '6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127\r\n6f964b49e37c42d9a0078c14fcc33127', 'songhao', '70871D1F655F6266C54ADDAEADE4BCBC', '宋豪', '男', '20', '', '', '0', '4', '1');
INSERT INTO `user` VALUES ('16', '4e810c23b9c34633a21a83efbecb256f', 'ssdftw', 'AC182D1A70EEC2B0451921606C4B5038', '121', '男', '122', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('17', 'a351f617f77148d38bfc4ef64b1cdb39', 'weewq', '30D56682AC1EC33924648892CD58FDCC', 'ds', '男', '12', '', '', '0', '2', '1');
INSERT INTO `user` VALUES ('18', '8bb63fb4c60f4857af1c5b653bffba07', 'wenchen', '3EAE24F429DEAD060334275C71B152B7', '文臣', '男', '20', '437631891@qq.com', '15071451506', '1', '4', '2');
INSERT INTO `user` VALUES ('19', '49bb63e12b384283856c741eac2dec06', 'wenchen1', '4A717165D9873A4173DA5B48960B7A2E', '文臣', '女', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('20', '51f77905eaf84947a57beb8fc9c78992', 'wenchen10', '4B35A210F3C23DAC27A4F27E332C6FA4', '文臣10', '男', '3', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('21', '84a9f8d7873848ef9ebcb47cb1045fb1', 'wenchen11', '241E38C194059DB950DD504ED2D61C06', '文臣11', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('22', '798204b6b6e34f88ac06d7124c6cca23', 'wenchen111', 'E1B33A242C2D452EC874386406D3001A', 'wenc', '男', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('23', '0e568c53e0f54e638a95c4e4a074e8d8', 'wenchen1111', '331EA32985C585D0C228D8B36B8AEBE1', '文臣1111', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('24', '8ebc6e41f478431b9b7c36c0b3c1afd2', 'wenchen1112a', '77AD557816FB98FD1DE26F875203DC27', 'aa', '女', '11', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('25', 'da9288f2048f4d58875d90bd816b3f7c', 'wenchen12', 'A9FE0D95D11A2D0AE8AD7B9713CC2D91', '文臣12', '男', '3', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('26', '2917a8e71bc54daf9d82b915762e74a9', 'wenchen2', '8A4B6FC981408BFB4A1AE74E063F90B9', '文臣2', '女', '41', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('27', '0927ca91313a4fe6983a15cdb22152f7', 'wenchen3', 'BC4B23665A6CBEB806A822AE9527376A', '文臣3', '男', '111', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('28', '95e5197f352146588cd062689e117404', 'wenchen4', 'E96AF3C7D33682CA636E322AA40739CB', '文臣4', '女', '21', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('29', '11fe6e4ee09c492aade363534929013f', 'wenchen5', '7B7D8230E1B0B400B09F35A640B85AE0', '文臣', '男', '32', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('30', '9c90b4e038da49719e6a6d67dbfe7da3', 'wenchen6', '450916D09FEA68E2E8945D8B1100C0ED', '文臣6', '男', '13', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('31', '767ec177b9dc4339bb785268908af30d', 'wenchen7', '5078778F5D50F2B610F35529132E1F25', '文臣7', '男', '1', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('32', '064006c6bf9a47ec95dcfaceecc79127', 'wenchen8', '595434DF3E580CB9E60DB9C595F8AF36', '文臣8', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('33', '2b00365771d44e49931c27e0f4838959', 'wenchen9', '395CA8D4FCC38C211CDE2222C9945507', '文臣9', '男', '12', '', '', '0', '1', '1');
INSERT INTO `user` VALUES ('34', '0cd39259c28e4fac9919674950176a9d', 'wenjiabao', 'wenjiabao123456', '稳架包', '女', '50', '434732@qq.com', '11464122', '0', '1', '1');
INSERT INTO `user` VALUES ('35', '513fabed237d48439da444d35d5e8fb6', 'xijinping', 'E1EC84D67E7C7D934DB5A873E471F47D', '习京平', '男', '50', '', '', '1', '2', '1');
INSERT INTO `user` VALUES ('36', '16fea50768d94ea0ba1650f6c1e71985', 'zhangjie', '4797D6402E91993A5B3C61CF93033B73', '张杰', '男', '20', '', '', '1', '1', '1');

-- ----------------------------
-- Table structure for `user_authory`
-- ----------------------------
DROP TABLE IF EXISTS `user_authory`;
CREATE TABLE `user_authory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `authory_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_authory
-- ----------------------------

-- ----------------------------
-- Table structure for `user_eva`
-- ----------------------------
DROP TABLE IF EXISTS `user_eva`;
CREATE TABLE `user_eva` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_eva
-- ----------------------------
INSERT INTO `user_eva` VALUES ('1', 'wenjiabao', '无良商家');
INSERT INTO `user_eva` VALUES ('2', 'xijinping', 'sssssssss无良商家');
INSERT INTO `user_eva` VALUES ('3', 'ms', 'fdsfsdfsdf无良商家fdfdsf');

-- ----------------------------
-- Table structure for `validate`
-- ----------------------------
DROP TABLE IF EXISTS `validate`;
CREATE TABLE `validate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8 DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `birthday` date DEFAULT '2000-01-01',
  `id_card` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  `city` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of validate
-- ----------------------------
INSERT INTO `validate` VALUES ('1', 'wenchen', '文臣', '1996-04-25', '420822199604256738', '17', '1');
INSERT INTO `validate` VALUES ('2', 'wenjiabao', '稳架包', '2017-05-31', '666666666666666666', '17', '1');
INSERT INTO `validate` VALUES ('3', 'xijinping', '习京平', '2000-01-01', '', '17', '1');
INSERT INTO `validate` VALUES ('4', 'likeqiang', '李克强', '2000-01-01', '', '1', '18');
INSERT INTO `validate` VALUES ('5', 'ms', '', '2000-01-01', '', '1', '18');

-- ----------------------------
-- Table structure for `web_user`
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT '',
  `age` int(2) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user
-- ----------------------------
INSERT INTO `web_user` VALUES ('1', 'wenchen', '3EAE24F429DEAD060334275C71B152B7', '', '0', null, null);
INSERT INTO `web_user` VALUES ('2', 'wenchen1', '4A717165D9873A4173DA5B48960B7A2E', '', '0', null, null);
INSERT INTO `web_user` VALUES ('4', 'wenchen2', '8A4B6FC981408BFB4A1AE74E063F90B9', '', '0', null, null);
INSERT INTO `web_user` VALUES ('5', 'wenchen3', 'BC4B23665A6CBEB806A822AE9527376A', '男', '0', 'dhasuid@qq.com', null);
INSERT INTO `web_user` VALUES ('6', 'wenchen4', 'E96AF3C7D33682CA636E322AA40739CB', '男', '0', '4123@qq.com', null);
INSERT INTO `web_user` VALUES ('7', 'wenchen5', '7B7D8230E1B0B400B09F35A640B85AE0', '男', '0', 'wenchkl@qq.com', null);
INSERT INTO `web_user` VALUES ('8', 'wenchen6', '450916D09FEA68E2E8945D8B1100C0ED', '女', '0', 'dasd2@sina.com', null);
INSERT INTO `web_user` VALUES ('9', '', 'D41D8CD98F00B204E9800998ECF8427E', '男', '0', '', null);

-- ----------------------------
-- View structure for `v_news`
-- ----------------------------
DROP VIEW IF EXISTS `v_news`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_news` AS select `news`.`Id` AS `Id`,`news`.`dm` AS `dm`,`news`.`lx` AS `lx`,`news`.`title` AS `title`,`news`.`sqr` AS `sqr`,`news`.`imgUrl` AS `imgUrl`,`news`.`href` AS `href`,`news`.`date` AS `date`,`news`.`zt` AS `zt`,`news`.`remark` AS `remark`,`cg`.`fzr` AS `fzr`,`cg`.`glr` AS `glr` from ((`j_news` `news` join `user` `u` on((`u`.`uname` = `news`.`sqr`))) join `c_group` `cg` on((`cg`.`Id` = `u`.`groupId`))) ;

-- ----------------------------
-- Procedure structure for `privility`
-- ----------------------------
DROP PROCEDURE IF EXISTS `privility`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `privility`(IN  role INT)
BEGIN
	DECLARE temp INT DEFAULT 0;
	DECLARE num INT DEFAULT 0;
	DECLARE row CURSOR FOR SELECT Id FROM menu;
	DECLARE EXIT HANDLER FOR NOT FOUND CLOSE row;
	SELECT count(*) INTO num FROM menu_role;
	OPEN row;
	REPEAT
		FETCH row INTO temp;
		INSERT INTO menu_role(role_id,menu_id) VALUES (role,temp);
		set num=num-1;
	UNTIL 0 END REPEAT;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TEST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TEST`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `TEST`()
BEGIN
	DECLARE temp_id INT;
	DECLARE temp_lx INT;
	DECLARE num INT;
	DECLARE row CURSOR FOR SELECT Id,lx FROM j_news;
	DECLARE EXIT HANDLER FOR NOT FOUND CLOSE row;
	SELECT COUNT(*) INTO num FROM j_news;
		OPEN row;
		REPEAT
			FETCH row INTO temp_id,temp_lx;
			UPDATE j_news SET dm=CONCAT(temp_id,temp_lx) WHERE Id=temp_id;
			SET num = num-1;
		UNTIL 0 END REPEAT;
		CLOSE row;
END
;;
DELIMITER ;
