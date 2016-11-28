-- -----------------------------------
-- Saltgurka Update 14
-- -----------------------------------
 
-- Manna biscuits can now be eaten by hunter pets
UPDATE `item_template` SET `foodtype`=4 WHERE `entry`=34062;
 
-- Hemorrhage no longer procs on non-physical spells.
DELETE FROM `spell_proc_event` WHERE `entry` IN (16511,17347,17348,26864);
INSERT INTO `spell_proc_event` (`entry`,`SpellFamilyName`,`procFlags`) VALUES
(16511,8,0x000222A8),
(17347,8,0x000222A8),
(17348,8,0x000222A8),
(26864,8,0x000222A8);
 
 
-- Rampage. First proc is on melee crit only, all following procs are on both melee normal and melee crit hits.
UPDATE `spell_proc_event` SET `procEx`=3 WHERE `entry` IN (29801,30030,30033);
-- Fix exploit that allowed you to cancel the stacking aura, but that didn't remove the invisible aura, which mean you would start stacking again without having to pay 20 Rage to activate it.
-- This exploit allowed the buff to last double as long if you did it at the right moment.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`='-30032';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES ('-30032', '-30033', 'Remove Warrior Rampage trigger if player cancels the Stacking Aura.');

-- Tyrantus 20931
SET @GUID := 86748;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (86748, 20931, 530, 1, 0, 0, 5050.57, 2896.73, 83.7779, 0.130239, 160, 0, 0, 9335, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (86748, 1, 5116.44, 2905.53, 77.0648, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 2, 5133.4, 2909.44, 72.4063, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 3, 5183.69, 2891.85, 54.6853, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 4, 5192.38, 2910.73, 58.1054, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 5, 5180.38, 2916.19, 64.381, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 6, 5146.01, 2941.57, 74.6116, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 7, 5139.39, 2946.47, 71.6427, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 8, 5121.76, 2930.02, 78.2033, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 9, 5090.15, 2937.53, 83.9492, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 10, 5049.37, 2951.28, 87.6848, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 11, 5044.55, 2913.1, 88.6466, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (86748, 12, 5050.4, 2896.25, 83.7468, 0, 0, 0, 0, 0);

-- Magistrix Seyla
UPDATE `creature` SET `spawnmask` = 0 WHERE `id` = 24937;

-- Trigger NPC
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 24921;

SET @GUID := 64246;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64246, 18121, 530, 1, 0, 0, 1487.56, 8615.63, -25.3721, 0.142035, 300, 0, 0, 4422, 2620, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64246, 1, 1526.74, 8614.7, -31.361, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64246, 2, 1610.06, 8604.58, -28.9488, 5000, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64246, 3, 1543.33, 8612.67, -32.8239, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64246, 4, 1481, 8617.21, -22.3273, 5000, 0, 0, 0, 0);

-- Ango'rosh Souleater - Movement
UPDATE `creature_ai_scripts` SET `action1_param1`='1' WHERE `id` IN (1812101,1812107);

-- Quest Convenience
UPDATE item_template SET stackable = 1 WHERE entry = 31346; -- 1

-- Poor Weapons (Gold Inflation) 24001
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 3 WHERE `mincountOrRef` = -24001; -- 5
-- Poor Armor (Gold Inflation) 24002
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 3 WHERE `mincountOrRef` = -24002; -- 5

SET @GUID := 64223;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64223, 18120, 530, 1, 0, 0, 1394.52, 8623.38, 9.4831, 3.23446, 300, 0, 0, 5527, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64223, 1, 1394.52, 8623.38, 9.4831, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 2, 1367.01, 8620, 14.6973, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 3, 1348.54, 8608.5, 18.9828, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 4, 1330.3, 8594.46, 20.7081, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 5, 1312.62, 8590.25, 19.8928, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 6, 1271.03, 8590.59, 19.0253, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 7, 1312.62, 8590.25, 19.8928, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 8, 1330.3, 8594.46, 20.7081, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 9, 1348.51, 8608.5, 18.9951, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 10, 1367.01, 8620, 14.6973, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 11, 1394.52, 8623.38, 9.4831, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 12, 1409.57, 8618.85, 5.86771, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 13, 1424.44, 8607.31, 3.25742, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 14, 1441.44, 8607.56, -2.58179, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 15, 1461.23, 8614.6, -12.2068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 16, 1484.59, 8616.81, -23.6464, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 17, 1461.68, 8614.68, -12.7068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 18, 1441.52, 8607.56, -2.71729, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 19, 1424.44, 8607.31, 3.25742, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64223, 20, 1409.57, 8618.85, 5.86771, 0, 0, 0, 100, 0);

SET @GUID := 64228;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64228, 18120, 530, 1, 0, 0, 1764.78, 8621.49, 3.29565, 3.50196, 300, 0, 0, 5527, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64228, 1, 1764.78, 8621.49, 3.29565, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 2, 1755.78, 8625.82, 4.38501, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 3, 1744.3, 8627.53, 6.18872, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 4, 1729.12, 8630.34, 6.31183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 5, 1717.92, 8632.59, 8.06501, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 6, 1699.81, 8628.59, 12.0102, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 7, 1689.12, 8621.33, 12.5069, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 8, 1681.7, 8611.76, 12.6384, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 9, 1675, 8605.29, 12.3617, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 10, 1664.97, 8601.52, 10.784, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 11, 1655.83, 8594.22, 8.95046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 12, 1649.31, 8586.1, 8.34609, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 13, 1655.83, 8594.22, 8.95046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 14, 1664.97, 8601.52, 10.784, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 15, 1675, 8605.29, 12.3617, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 16, 1681.7, 8611.76, 12.6384, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 17, 1689.12, 8621.33, 12.5069, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 18, 1699.81, 8628.59, 12.0102, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 19, 1717.92, 8632.59, 8.06501, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 20, 1729.12, 8630.34, 6.31183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 21, 1744.3, 8627.53, 6.18872, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 22, 1755.78, 8625.82, 4.38501, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 23, 1764.72, 8621.62, 3.3584, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 24, 1770.79, 8609.97, 0.86006, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 25, 1778.08, 8581.91, -7.02197, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 26, 1781.57, 8556.62, -9.00761, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 27, 1791.78, 8532.47, -16.7822, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 28, 1806.07, 8517.05, -16.5287, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 29, 1812.22, 8498.1, -19.5813, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 30, 1805.24, 8477.74, -19.6905, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 31, 1809.99, 8468.15, -16.3652, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 32, 1822.48, 8447.89, -16.8868, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 33, 1809.99, 8468.15, -16.3652, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 34, 1805.24, 8477.74, -19.6905, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 35, 1812.22, 8498.1, -19.5813, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 36, 1806.07, 8517.05, -16.5287, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 37, 1791.8, 8532.45, -16.8339, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 38, 1781.57, 8556.62, -9.00761, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 39, 1778.08, 8581.91, -7.02197, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64228, 40, 1770.79, 8609.97, 0.86006, 0, 0, 0, 100, 0);

SET @GUID := 64232;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64232, 18120, 530, 1, 0, 0, 1608.69, 8551.91, -15.6161, 2.68401, 300, 0, 0, 5527, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64232, 1, 1608.69, 8551.91, -15.6161, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 2, 1606.19, 8568.75, -21.7997, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 3, 1608.48, 8584.46, -29.3473, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 4, 1606.19, 8568.75, -21.7997, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 5, 1608.68, 8551.94, -15.4296, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 6, 1611.31, 8535.48, -8.69375, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 7, 1615.58, 8524.72, -6.33484, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 8, 1622.58, 8518.37, -5.84937, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 9, 1631.16, 8510.86, -6.80164, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 10, 1644.64, 8504.22, -7.0206, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 11, 1654.69, 8501.37, -6.63352, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 12, 1665.91, 8502.83, -6.9249, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 13, 1672.21, 8501.25, -7.81, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 14, 1677.83, 8494.04, -8.56403, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 15, 1689.13, 8484.7, -7.43525, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 16, 1700.16, 8477, -6.36907, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 17, 1689.13, 8484.7, -7.43525, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 18, 1677.83, 8494.04, -8.56403, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 19, 1672.21, 8501.25, -7.81, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 20, 1665.91, 8502.83, -6.9249, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 21, 1654.69, 8501.37, -6.63352, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 22, 1644.64, 8504.22, -7.0206, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 23, 1631.16, 8510.86, -6.80164, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 24, 1622.58, 8518.37, -5.84937, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 25, 1615.58, 8524.72, -6.33484, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64232, 26, 1611.31, 8535.48, -8.69375, 0, 0, 0, 100, 0);

SET @GUID := 64239;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64239, 18120, 530, 1, 0, 0, 1643.83, 8612.98, -31.1259, 5.05577, 300, 0, 0, 5527, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64239, 1, 1643.83, 8612.98, -31.1259, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 2, 1636.37, 8611.65, -28.4568, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 3, 1631.08, 8610.18, -27.16, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 4, 1624.01, 8607.95, -25.6686, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 5, 1630.67, 8610.06, -27.0775, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 6, 1636.37, 8611.65, -28.4568, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 7, 1643.82, 8612.98, -31.1251, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 8, 1653.17, 8612.42, -33.3041, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 9, 1659.04, 8606.21, -35.0201, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 10, 1663.34, 8595.79, -39.4456, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 11, 1668.67, 8580.87, -43.5667, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 12, 1672.77, 8571.9, -45.457, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 13, 1683.16, 8565.99, -47.1843, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 14, 1706.9, 8560.65, -45.6206, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 15, 1683.16, 8565.99, -47.1843, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 16, 1672.77, 8571.9, -45.457, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 17, 1668.67, 8580.87, -43.5667, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 18, 1663.34, 8595.79, -39.4456, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 19, 1659.04, 8606.21, -35.0201, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64239, 20, 1653.17, 8612.42, -33.3041, 0, 0, 0, 100, 0);

SET @GUID := 64241;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64241, 18120, 530, 1, 0, 0, 1654.65, 8521.53, -53.5835, 3.14159, 300, 0, 0, 5527, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64241, 1, 1654.65, 8521.53, -53.5835, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 2, 1649.62, 8510.09, -54.2113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 3, 1648.94, 8498.17, -53.8317, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 4, 1656.67, 8485.06, -55.7098, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 5, 1668.38, 8473.03, -58.7728, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 6, 1682.67, 8469.87, -61.031, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 7, 1693.72, 8469.74, -60.3237, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 8, 1702.25, 8470.65, -59.5008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 9, 1715.03, 8473.5, -57.4673, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 10, 1702.25, 8470.65, -59.5008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 11, 1693.75, 8469.74, -60.2351, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 12, 1682.67, 8469.87, -61.031, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 13, 1668.38, 8473.03, -58.7728, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 14, 1656.67, 8485.06, -55.7098, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 15, 1648.94, 8498.17, -53.8317, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 16, 1649.62, 8510.09, -54.2113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 17, 1654.65, 8521.53, -53.5835, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 18, 1664.27, 8535.21, -51.2856, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 19, 1673.35, 8538.97, -49.8396, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 20, 1687.69, 8539.3, -49.183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 21, 1698.44, 8539.61, -48.2535, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 22, 1687.69, 8539.3, -49.183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 23, 1673.36, 8538.98, -49.8888, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (64241, 24, 1664.27, 8535.21, -51.2856, 0, 0, 0, 100, 0);

SET @GUID := 64259;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (64259, 18121, 530, 1, 0, 0, 1701.71, 8476.47, -6.14528, 2.68781, 300, 0, 0, 4422, 2620, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (64259, 1, 1681.44, 8486.82, -8.04557, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 2, 1670.9, 8499.21, -7.93905, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 3, 1656.29, 8499.72, -6.64107, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 4, 1636.63, 8506.09, -7.37743, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 5, 1619.45, 8519.54, -5.86774, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 6, 1612.97, 8530.24, -7.36203, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 7, 1611.98, 8538.14, -9.667, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 8, 1608.91, 8559.17, -18.6553, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 9, 1606.81, 8566.77, -20.9001, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 10, 1607.43, 8574.21, -24.1375, 10000, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 11, 1605.88, 8566.47, -20.8363, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 12, 1609.4, 8557.97, -18.1479, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 13, 1610.9, 8540.09, -10.5095, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 14, 1612.82, 8526.25, -6.42162, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 15, 1624.66, 8514.33, -6.42656, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 16, 1643.3, 8503.39, -7.19652, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 17, 1659.96, 8500.68, -6.61295, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 18, 1672.67, 8498.77, -8.13133, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_data` VALUES (64259, 19, 1702.05, 8479.28, -6.15383, 10000, 0, 0, 0, 0);
