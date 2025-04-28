INSERT INTO realisateur (id_realisateur, nom_realisateur, prenom_realisateur) VALUES
('48173b50-0f9e-4eef-9d3e-682b015cb5ce', 'Hess', 'Jared'),      -- Minecraft
('638d1c05-5581-4c29-b635-26ebb7f2dd72', 'Stanton', 'Andrew'),  -- Nemo
('c1f23395-6f46-4af4-89ba-b16132e26656', 'Fowler', 'Jeff'),     -- Sonic
('ecf6c7e5-1a9c-4341-b756-4a9654de192b', 'Jelenic', 'Michael'), -- Mario
('21552e22-134d-4b17-bb7a-18b8a424f954', 'Jenson', 'Vicky');    -- Shrek

INSERT into film (id_film, titre, date_de_sortie, duree, id_realisateur) VALUES
('cd219724-f963-436f-abec-e2bd31c2f9b7', 'Minecraft, le film', '2025-04-02', '01:41', '48173b50-0f9e-4eef-9d3e-682b015cb5ce'),          -- Jared Hess
('5dbfcfbd-395f-4986-ab7d-d231f97f2f56', 'Le Monde de Nemo', '2003-11-26', '01:40', '638d1c05-5581-4c29-b635-26ebb7f2dd72'),            -- Andrew Stanton
('34b9718c-f98d-417f-8064-b3f277d0bfc3', 'Wall-E', '2008-07-30', '01:37', '638d1c05-5581-4c29-b635-26ebb7f2dd72'),                      -- Andrew Stanton
('b224f19a-acf1-46c3-b70b-ee848fc2d2c8', 'Sonic, le film', '2020-02-09', '01:39', 'c1f23395-6f46-4af4-89ba-b16132e26656'),              -- Jeff Fowler
('0ded922f-0e81-460d-be1f-a6e36303f508', 'Super Mario Bros., le film', '2023-04-05', '01:32', 'ecf6c7e5-1a9c-4341-b756-4a9654de192b'),  -- Michael Jelernic
('9a6b530b-a60e-4905-a858-82ec2c3bd85b', 'Shrek', '2001-07-04', '01:29', '21552e22-134d-4b17-bb7a-18b8a424f954');                       -- Vicky Jenson

INSERT INTO role_film (nom_role, id_film) VALUES
('STEVE', '36887af2-e44c-4edb-a81d-775015025ef5'),
('NEMO', 'abfe5fe6-47ea-4b44-8efa-9823252162fa'),
('SONIC', 'cc8d9077-91fd-4f17-b396-d72f54d06524');

insert into acteur (nom_acteur, prenom_acteur, date_de_naissance) values
('black', 'jack', '1969-08-29'),
('Gould', 'Alenxander', '1958-04-29'),
('Schwartz', 'Ben', '1986-09-26');

insert into cinephile (nom_cinephile, prenom_cinephile,email,mot_de_passe)
values
('con', 'Jean','con.Jean@gmail.com','k8T$zL2p@Wy34Q!rX#VuM7ejFtNB5h&1GZx*DqoRLa93s^AYCHUbEKvm6wnPJitg'),
('chan', 'jacky', 'jacky@gmail.com','Xv#R4yEmgBZP6uC2&!AqtL$V7NdxMpFJWs@9oK3hnYzfjHb^GEclTri58DQwXU0*'),
('delon', 'alain', 'alain.delon@gmail.com','@z4TNuDqXy2W!cREoFv#GjmYMp9&5BKJaihsVZLxlUtrA6HnbPfQkCg*378dSX0');

insert into film_preferer (id_cinephile, id_film) values
('99f5791e-84a3-4f17-b4d3-fb7477108716','36887af2-e44c-4edb-a81d-775015025ef5'),
('10d5e101-ec0c-41f2-b341-c7708853546e','cc8d9077-91fd-4f17-b396-d72f54d06524'),
('10d5e101-ec0c-41f2-b341-c7708853546e','36887af2-e44c-4edb-a81d-775015025ef5'),
('a157105e-f8cd-4cfd-aa07-3d742d56f95c','abfe5fe6-47ea-4b44-8efa-9823252162fa');

insert into role_preferer (id_cinephile, id_role) values
('99f5791e-84a3-4f17-b4d3-fb7477108716','9e525fe1-44c5-40a1-ad3a-cf0299dad6a9'),
('a157105e-f8cd-4cfd-aa07-3d742d56f95c','eca414a4-5180-453d-be83-60d1597c8e17'),
('10d5e101-ec0c-41f2-b341-c7708853546e','9e525fe1-44c5-40a1-ad3a-cf0299dad6a9'),
('10d5e101-ec0c-41f2-b341-c7708853546e','754674f2-a803-4694-9bcd-4548f767e63f');

insert into jouer (id_acteur, id_role) values
('3539e136-00de-43f7-9858-20160e76ecbb','9e525fe1-44c5-40a1-ad3a-cf0299dad6a9'),
('9a54998c-46c8-45a8-ae77-d9bf48be4230','eca414a4-5180-453d-be83-60d1597c8e17'),
('8f23a168-1438-4166-a4a0-7202e450659f','754674f2-a803-4694-9bcd-4548f767e63f');