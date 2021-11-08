--1
SELECT `users`.`id`, `name`, `train`, `seat_number`
FROM `users` INNER JOIN `tickets` ON `users`.`id`=`tickets`.`user`
WHERE `tickets`.`train`=11 ORDER BY `seat_number` ASC;\

--2
SELECT `users`.`id`, `users`.`name`, Count(*) as `trains_count`,
Round(Sum(`distance`)*0.1, 4) AS `total_distance`
FROM `tickets` INNER JOIN `users` ON `tickets`.`user`=`users`.`id`
INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id`
GROUP BY `user` ORDER BY `total_distance` DESC LIMIT 0, 6;

--3
SELECT `trains`.`id`, `types`.`name` AS `type`, `source`.`name` AS `src_stn`,
`dest`.`name` AS `dst_stn`, Timediff(`arrival`, `departure`) AS `travel_time`
FROM `trains` INNER JOIN `types` ON `trains`.`type`=`types`.`id`
INNER JOIN `stations` AS `source` ON `trains`.`source`=`source`.`id`
INNER JOIN `stations` AS `dest` ON `trains`.`destination`=`dest`.`id`
ORDER BY `travel_time` DESC LIMIT 0, 6;

--4
SELECT `types`.`name` AS `type`, `source`.`name` AS `src_stn`,
`dest`.`name` AS `dst_stn`, `departure`, `arrival`,
Round(`fare_rate`*`distance`*0.001, -2) AS `fare`
FROM `trains` INNER JOIN `types` ON `trains`.`type`=`types`.`id`
INNER JOIN `stations` AS `source` ON `trains`.`source`=`source`.`id`
INNER JOIN `stations` AS `dest` ON `trains`.`destination`=`dest`.`id`
ORDER BY `departure` ASC;

--5
SELECT `trains`.`id`, `types`.`name` AS `type`,
`source`.`name` AS `src_stn`, `dest`.`name` AS `dst_stn`,
Count(*) AS `occupied`, `max_seats` AS `maximum`
FROM `tickets` INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id`
INNER JOIN `types` ON `trains`.`type`=`types`.`id`
INNER JOIN `stations` AS `source` ON `trains`.`source`=`source`.`id`
INNER JOIN `stations` AS `dest` ON `trains`.`destination`=`dest`.`id`
GROUP BY `trains`.`id` ORDER BY `trains`.`id` ASC;

--6
SELECT `trains`.`id`, `types`.`name` AS `type`,
`source`.`name` AS `src_stn`, `dest`.`name` AS `dst_stn`,
Count(`tickets`.`id`) AS `occupied`, `max_seats` AS `maximum`
FROM `tickets` RIGHT OUTER JOIN `trains` ON `tickets`.`train`=`trains`.`id`
INNER JOIN `types` ON `trains`.`type`=`types`.`id`
INNER JOIN `stations` AS `source` ON `trains`.`source`=`source`.`id`
INNER JOIN `stations` AS `dest` ON `trains`.`destination`=`dest`.`id`
GROUP BY `trains`.`id` ORDER BY `trains`.`id` ASC LIMIT 0, 20;