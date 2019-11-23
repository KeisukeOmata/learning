SELECT players.name AS "選手名", teams.name AS  "前年所属していたチーム" FROM players
JOIN teams
ON players.previous_team_id = teams.id;