const { runQuery } = require('./database');
const express = require('express');
const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {
    const { uid } = req.query;
    const sql = 'SELECT `users`.`name` AS `username`,' +
        'Sum(Round(`fare_rate`*`distance`*0.001, -2)) AS `fare`' +
        'FROM `tickets` INNER JOIN `users` ON `tickets`.`user`=`users`.`id`' +
        'INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id`' +
        'INNER JOIN `types` ON `trains`.`type`=`types`.`id`' +
        'WHERE `tickets`.`user`=?';
    [{ username, fare }] = await runQuery(sql, [parseInt(uid)]);
    if (username)
        res.send(`Total fare of ${username} is ${fare} KRW.`);
    else
        res.send('Invalid Request!');
});

app.get('/train/status', async (req, res) => {
    const { tid } = req.query;
    const sql = 'SELECT `types`.`max_seats`, Count(*) AS `cnt`' +
        'FROM `tickets` INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id`' +
        'INNER JOIN `types` ON `trains`.`type`=`types`.`id`' +
        'WHERE `tickets`.`train`=?';
    [{ max_seats, cnt }] = await runQuery(sql, [parseInt(tid)]);
    res.send(`Train ${parseInt(tid)} is ${parseInt(max_seats)==cnt ? '' : 'not '}sold out`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));