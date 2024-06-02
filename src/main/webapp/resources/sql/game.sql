CREATE TABLE IF NOT EXISTS game(
	g_id VARCHAR(10) NOT NULL,
	g_name VARCHAR(20),
	g_unitPrice INTEGER,
	g_producer VARCHAR(20),
	g_description VARCHAR(100),
	g_publisher VARCHAR(20),
	g_category VARCHAR(20),
	g_releaseDate VARCHAR(20),
	g_fileName VARCHAR(50),
	g_rating INTEGER,
	g_rating_count INTEGER,
	g_review VARCHAR(100),
	PRIMARY KEY(g_id)
) DEFAULT CHARSET = utf8;