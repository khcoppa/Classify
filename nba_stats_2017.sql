CREATE TABLE players (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  position VARCHAR(255) NOT NULL,
  ppg FLOAT(2,1) NOT NULL,
  contract_amt INTEGER,
  team_id INTEGER,

  FOREIGN KEY(team_id) REFERENCES team(id)
);

CREATE TABLE teams (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  gm_id INTEGER NOT NULL,

  FOREIGN KEY(gm_id) REFERENCES gm(id)
);

CREATE TABLE GMs (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO
  players (id, name, position, ppg, contract_amt, team_id)
VALUES
  (1, 'Russell Westbrook', 'PG', 31.6, 205030000, 7)
  (2, 'Andrew Wiggins', 'SG', 23.6, 146450000, 6)
  (3, 'John Wall', 'PG', 23.1, 169344000, 2)
  (4, 'Anthony Davis', 'PF', 28.0, 127829970, 5)
  (5, 'Andre Drummond', 'C', 13.6, 127171313, 8)
  (6, 'LeBron James', 'SF', 26.4, 99857127, 1)
  (7, 'Giannis Antetokounmpo', 'SF', 22.9, 100000000, 10)
  (8, 'Gordon Hayward', 'SG', 21.9, 127829970, 9)
  (9, 'Joel Embiid', 'C', 20.3, 146450000, 3)
  (10, 'LaMarcus Aldridge', 'PF', 17.3, 84072030, 4)

INSERT INTO
  teams (id, name, state, gm_id)
VALUES
  (1, 'Cleveland Cavaliers', 'Ohio', 2)
  (2, 'Washington Wizards', 'Washington D.C.', 10)
  (3, 'Philadelphia 76ers', 'Pennsylvania', 8)
  (4, 'San Antonio Spurs', 'Texas', 9)
  (5, 'New Orleans Pelicans', 'Louisiana', 6)
  (6, 'Minnesota Timberwolves', 'Minnesota', 5)
  (7, 'Oklahoma City Thunder', 'Oklahoma', 7)
  (8, 'Detroit Pistons', 'Michigan', 3)
  (9, 'Boston Celtics', 'Massachusetts', 1)
  (10, 'Milwaukee Bucks', 'Wisconsin', 4)

INSERT INTO
  GMs (id, name)
VALUES
  (1, 'Danny Ainge')
  (2, 'Koby Altman')
  (3, 'Jeff Bower')
  (4, 'Jon Horst')
  (5, 'Scott Layden')
  (6, 'Dell Demps')
  (7, 'Sam Presti')
  (8, 'Bryan Colangelo')
  (9, 'R.C. Buford')
  (10, 'Ernie Grunfeld')
