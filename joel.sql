-- Connaître le temps moyen d’écoute d’une musique
DROP MATERIALIZED VIEW MV_AVG_LTM;
CREATE MATERIALIZED VIEW MV_AVG_LTM
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT TITLE, AVG(STREAM_DURATION) FROM SPOTIFY_STREAM, MUSIC_DIM
WHERE SPOTIFY_STREAM.MUSIC_KEY = MUSIC_DIM.MUSIC_KEY
GROUP BY TITLE;

-- Connaître les types de musique les plus écoutés suivant la région du globe
DROP MATERIALIZED VIEW MV_LMTR;
CREATE MATERIALIZED VIEW MV_LMTR
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT CONTINENT, COUNTRY, GENRE, TITLE, SUM(STREAM_DURATION) AS "streams_count"
FROM USER_DIM, MUSIC_DIM, SPOTIFY_STREAM
WHERE USER_DIM.USER_KEY = SPOTIFY_STREAM.USER_KEY
AND MUSIC_DIM.MUSIC_KEY = SPOTIFY_STREAM.MUSIC_KEY
GROUP BY CONTINENT, COUNTRY, GENRE, TITLE;

-- Connaître le nombre d'utilisateurs écoutant un certain genre de playlist suivant l'heure de la journée
DROP MATERIALIZED VIEW MV_ULKT;
CREATE MATERIALIZED VIEW MV_ULKT
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT TITLE, GENRE, PLAYLIST_DIM.YEAR, MONTH, DAY, COUNT(SPOTIFY_STREAM.USER_KEY)
FROM DATE_DIM, SPOTIFY_STREAM, USER_DIM, PLAYLIST_DIM
WHERE DATE_DIM.DATE_KEY = SPOTIFY_STREAM.DATE_KEY
AND USER_DIM.USER_KEY = SPOTIFY_STREAM.USER_KEY
AND PLAYLIST_DIM.PLAYLIST_KEY = SPOTIFY_STREAM.PLAYLIST_KEY
GROUP BY GENRE, TITLE, PLAYLIST_DIM.YEAR, MONTH, DAY;

-- Connaître les premiers musiques les plus écoutées sur les dernières 24 heures
DROP MATERIALIZED VIEW MV_MLM;
CREATE MATERIALIZED VIEW MV_MLM
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
DISABLE QUERY REWRITE
AS
SELECT TITLE, COUNT(STREAM_DURATION)
FROM SPOTIFY_STREAM, TIME_DIM, MUSIC_DIM
WHERE TIME_DIM.TIME_KEY = SPOTIFY_STREAM.DATE_KEY
AND MUSIC_DIM.MUSIC_KEY = SPOTIFY_STREAM.MUSIC_KEY
AND TIME_HOUR BETWEEN EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND (EXTRACT(HOUR FROM CURRENT_TIMESTAMP) - 1)
GROUP BY TITLE;
-- --
-- -- -- Connaître les genres musicaux préférés de chaque utilisateur grâce à ces derniers streams pour proposer des playlist similaires
DROP MATERIALIZED VIEW MV_UMGP;
CREATE MATERIALIZED VIEW MV_UMGP
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
DISABLE QUERY REWRITE
AS
SELECT NAME, EMAIL, PLAYLIST_DIM.TITLE, PLAYLIST_DIM.GENRE, SUM(STREAM_DURATION)
FROM USER_DIM, SPOTIFY_STREAM, DATE_DIM, PLAYLIST_DIM
WHERE USER_DIM.USER_KEY = SPOTIFY_STREAM.USER_KEY
AND DATE_DIM.DATE_KEY = SPOTIFY_STREAM.DATE_KEY
AND PLAYLIST_DIM.PLAYLIST_KEY = SPOTIFY_STREAM.PLAYLIST_KEY
AND DAY BETWEEN EXTRACT(DAY FROM CURRENT_DATE) AND (EXTRACT(DAY FROM CURRENT_DATE) - 7)
GROUP BY NAME, EMAIL, TITLE, GENRE;
--
-- -- Analyser quelles sont les promotions les plus efficaces grâce au nombre d'abonnements suivant une promotion donnée
DROP MATERIALIZED VIEW MV_VOEP;
CREATE MATERIALIZED VIEW MV_VOEP
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT PROMOTION_NAME, SUM(NUMBER_OF_USER)
FROM USER_DIM, SPOTIFY_SUBSCRIPTION_DIM, PROMOTION_DIM, SUBSCRIPTION_TYPE_DIM
WHERE USER_DIM.USER_KEY = SPOTIFY_SUBSCRIPTION_DIM.USER_KEY
AND PROMOTION_DIM.PROMOTION_KEY = SPOTIFY_SUBSCRIPTION_DIM.PROMOTION_KEY
AND SUBSCRIPTION_TYPE_DIM.SUBSCRIPTION_TYPE_KEY = SPOTIFY_SUBSCRIPTION_DIM.SUBSCRIPTION_TYPE_KEY
GROUP BY PROMOTION_NAME;
--
-- -- Analyser les promotions menant le plus souvent à un abonnement premium suivant l'âge d'un utilisateur
DROP MATERIALIZED VIEW MV_PRUA;
CREATE MATERIALIZED VIEW MV_PRUA
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT BIRTH_DATE, PROMOTION_NAME, COUNT(SPOTIFY_SUBSCRIPTION_DIM.SUBSCRIPTION_TYPE_KEY)
FROM PROMOTION_DIM, SPOTIFY_SUBSCRIPTION_DIM, USER_DIM
WHERE PROMOTION_DIM.PROMOTION_KEY = SPOTIFY_SUBSCRIPTION_DIM.PROMOTION_KEY
AND SPOTIFY_SUBSCRIPTION_DIM.USER_KEY = USER_DIM.USER_KEY
GROUP BY BIRTH_DATE, PROMOTION_NAME;
