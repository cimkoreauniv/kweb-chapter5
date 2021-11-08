const { runQuery } = require('./database');
const getScoreStats = async () => {
    const sql = 'SELECT course, Count(*) AS cnt, Avg(final) AS avg, ' +
        'Stddev(final) AS stddev FROM scores GROUP BY course';
    const results = await runQuery(sql);
    return results;
};
const getScoreByIdName = async (id, name) => {
    const sql = 'SELECT * FROM scores WHERE id = ? AND student = ?';
    const results = await runQuery(sql, [id, name]);
    return results[0];
};
const createScore = async (name, course, midterm, final) => {
    const sql = 'INSERT INTO scores VALUES (DEFAULT, ?, ?, ?, ?)';
    const result = await runQuery(sql, [name, course, midterm, final]);
    return results;
};
(async () => {
    const stats = await getScoreStats();
    stats.forEach(stat => {
        const { course, cnt, avg, stddev } = stat;
        console.log(`${course} (${cnt} people): Average ${avg}, Std.Dev. ${stddev}`);
    });
    const scoreData = await getScoreByIdName(2, 'Joe');
    const { course, final } = scoreData;
    console.log(`Course: ${course} / Final score: ${final}`);
    console.dir(await getScoreByIdName(9, 'Barack'));
    const newScore = await createScore('Barack', 'Operating Systems', 83, 62);
    console.dir(await getScoreByIdName(9, 'Barack'));
    console.dir(await getScoreByIdName(newScore.insertId, 'Barack'));
})();