INSERT INTO realisateur (id_realisateur, nom_realisateur, prenom_realisateur) VALUES
('48173b50-0f9e-4eef-9d3e-682b015cb5ce', 'Hess', 'Jared'),      -- Minecraft
('638d1c05-5581-4c29-b635-26ebb7f2dd72', 'Stanton', 'Andrew'),  -- Nemo
('c1f23395-6f46-4af4-89ba-b16132e26656', 'Fowler', 'Jeff'),     -- Sonic
('ecf6c7e5-1a9c-4341-b756-4a9654de192b', 'Jelenic', 'Michael'), -- Mario
('21552e22-134d-4b17-bb7a-18b8a424f954', 'Jenson', 'Vicky');    -- Shrek

INSERT INTO film (id_film, titre, date_de_sortie, duree, id_realisateur) VALUES
('cd219724-f963-436f-abec-e2bd31c2f9b7', 'Minecraft, le film', '2025-04-02', '01:41', '48173b50-0f9e-4eef-9d3e-682b015cb5ce'),          -- Jared Hess
('5dbfcfbd-395f-4986-ab7d-d231f97f2f56', 'Le Monde de Nemo', '2003-11-26', '01:40', '638d1c05-5581-4c29-b635-26ebb7f2dd72'),            -- Andrew Stanton
('34b9718c-f98d-417f-8064-b3f277d0bfc3', 'Wall-E', '2008-07-30', '01:37', '638d1c05-5581-4c29-b635-26ebb7f2dd72'),                      -- Andrew Stanton
('b224f19a-acf1-46c3-b70b-ee848fc2d2c8', 'Sonic, le film', '2020-02-09', '01:39', 'c1f23395-6f46-4af4-89ba-b16132e26656'),              -- Jeff Fowler
('0ded922f-0e81-460d-be1f-a6e36303f508', 'Super Mario Bros., le film', '2023-04-05', '01:32', 'ecf6c7e5-1a9c-4341-b756-4a9654de192b'),  -- Michael Jelernic
('9a6b530b-a60e-4905-a858-82ec2c3bd85b', 'Shrek', '2001-07-04', '01:29', '21552e22-134d-4b17-bb7a-18b8a424f954');                       -- Vicky Jenson

INSERT INTO role_film (id_role, nom_role, id_film) VALUES
('465e2f1a-7473-480c-8542-188d6e0f7239', 'Sonic', 'b224f19a-acf1-46c3-b70b-ee848fc2d2c8'),
('07bbea8d-0efd-424e-a6de-2189f40fb746', 'Mario', '0ded922f-0e81-460d-be1f-a6e36303f508'),
('52c8fb4f-915f-4b62-bf33-6ad0df700f7d', 'Shrek', '9a6b530b-a60e-4905-a858-82ec2c3bd85b'),
('cfb203ac-e2a9-4252-9265-96c075bb1a13', 'Nemo', '5dbfcfbd-395f-4986-ab7d-d231f97f2f56'),
('f83a6819-c439-425e-93c1-6f4b1db6a027', 'Wall-E', '34b9718c-f98d-417f-8064-b3f277d0bfc3'),
('28a9e047-0b66-4a85-8362-b95d8a668113', 'Steve', 'cd219724-f963-436f-abec-e2bd31c2f9b7');

INSERT INTO acteur (id_acteur, nom_acteur, prenom_acteur, date_de_naissance) VALUES
('92e6d1f0-34f4-4526-a6e4-d1e4014705d5', 'Schwartz', 'Ben', '1981-09-15'),      -- Sonic
('b9afae46-27ce-43b1-805f-c53db0a2beb4', 'Pratt', 'Chris', '1979-06-21'),       -- Mario
('e2f7311c-a105-42ce-9755-57627c8799c8', 'Myers', 'Mike', '1963-05-25'),        -- Shrek
('39a0a16e-9add-420b-9bac-5ed440cb2966', 'Gould', 'Alexander', '1994-04-04'),   -- Nemo
('954f0832-d337-410a-944e-1f4d8fe34f01', 'Burtt', 'Ben', '1948-07-12'),         -- Wall-E
('793420c4-71f4-43e5-a76b-ea47fd346d0a', 'Black', 'Jack', '1969-08-29');        -- Steve

INSERT INTO cinephile (id_cinephile, nom_cinephile, prenom_cinephile, email, mot_de_passe) VALUES
('10f251b7-c76a-4ea0-aace-09ff0574d1da', 'Bon', 'Jean','bon.jean@gmail.com','k8T$zL2p@Wy34Q!rX#VuM7ejFtNB5h&1GZx*DqoRLa93s^AYCHUbEKvm6wnPJitg'),
('2bf1263d-9015-4896-94c5-9cf5be3821d9', 'Chan', 'Jacky', 'jacky@gmail.com','Xv#R4yEmgBZP6uC2&!AqtL$V7NdxMpFJWs@9oK3hnYzfjHb^GEclTri58DQwXU0*'),
('2a689e64-7292-4a28-bdac-836f731bd064', 'Delon', 'Alain', 'alain.delon@gmail.com','@z4TNuDqXy2W!cREoFv#GjmYMp9&5BKJaihsVZLxlUtrA6HnbPfQkCg*378dSX0');

INSERT INTO film_preferer (id_cinephile, id_film) VALUES
('10f251b7-c76a-4ea0-aace-09ff0574d1da', '0ded922f-0e81-460d-be1f-a6e36303f508'),
('2bf1263d-9015-4896-94c5-9cf5be3821d9', 'b224f19a-acf1-46c3-b70b-ee848fc2d2c8'),
('2a689e64-7292-4a28-bdac-836f731bd064', 'cd219724-f963-436f-abec-e2bd31c2f9b7'),
('2a689e64-7292-4a28-bdac-836f731bd064', '9a6b530b-a60e-4905-a858-82ec2c3bd85b');

INSERT INTO role_preferer (id_cinephile, id_role) VALUES
('10f251b7-c76a-4ea0-aace-09ff0574d1da', '07bbea8d-0efd-424e-a6de-2189f40fb746'), -- Jean Bon - Mario
('2bf1263d-9015-4896-94c5-9cf5be3821d9', '465e2f1a-7473-480c-8542-188d6e0f7239'), -- Jacky Chan - Sonic
('2a689e64-7292-4a28-bdac-836f731bd064', '28a9e047-0b66-4a85-8362-b95d8a668113'), -- Alain Delon - Steve
('2a689e64-7292-4a28-bdac-836f731bd064', '52c8fb4f-915f-4b62-bf33-6ad0df700f7d'); -- Alain Delon - Shrek

INSERT INTO jouer (id_acteur, id_role) VALUES
('92e6d1f0-34f4-4526-a6e4-d1e4014705d5', '465e2f1a-7473-480c-8542-188d6e0f7239'),   -- Ben Schwartz - Sonic
('b9afae46-27ce-43b1-805f-c53db0a2beb4', '07bbea8d-0efd-424e-a6de-2189f40fb746'),   -- Chris Pratt - Mario
('e2f7311c-a105-42ce-9755-57627c8799c8', '52c8fb4f-915f-4b62-bf33-6ad0df700f7d'),   -- Mike Myers - Shrek
('39a0a16e-9add-420b-9bac-5ed440cb2966', 'cfb203ac-e2a9-4252-9265-96c075bb1a13'),   -- Alexander Gould - Nemo
('954f0832-d337-410a-944e-1f4d8fe34f01', 'f83a6819-c439-425e-93c1-6f4b1db6a027'),   -- Ben Burtt - Wall-E
('793420c4-71f4-43e5-a76b-ea47fd346d0a', '28a9e047-0b66-4a85-8362-b95d8a668113');   -- Jack Black - Steve