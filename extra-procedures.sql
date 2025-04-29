-- update un film
create or replace procedure update_film(
    in p_id_film uuid,
    in p_titre varchar(250),
    in p_annee_de_sortie smallint,
    in p_duree time,
    in p_id_realisateur uuid
)
language plpgsql
as $$
begin 
update film 
set titre = coalesce(p_titre , titre),
    annee_de_sortie = coalesce(p_annee_de_sortie , annee_de_sortie),
    duree = coalesce(p_duree, duree),
    id_realisateur = coalesce(p_id_realisateur, id_realisateur)
    where id_film = p_id_film;
end;
$$;

-- appeler la procedure
call update_film('43748c8d-df99-426d-9903-792d1cfa84fb', 'Mario Bros', NULL, NULL, NULL);

-- delete un realisateur et les films associés
create or replace procedure delete_realisateur(
    in p_id_realisateur UUID
)
language plpgsql
as $$
begin
delete from film where id_realisateur = p_id_realisateur;
delete from realisateur where id_realisateur = p_id_realisateur;
end;
$$;

-- appeler la procedure
call delete_realisateur('43748c8d-df99-426d-9903-792d1cfa84fb');

-- delete un film et les roles associés 
create or replace procedure delete_film(
    in p_id_film UUID
)
language plpgsql
as $$
begin
delete from role_film where id_film = p_id_film;
delete from film where id_film = p_id_film;
end;
$$;

-- appeler la procedure
call delete_film('43748c8d-df99-426d-9903-792d1cfa84fb');

-- creer un realisateur
create or replace procedure create_realisateur(
    in p_nom_realisateur varchar(50),
    in p_prenom_realisateur varchar(50)
)
language plpgsql
as $$
begin 
insert into realisateur (nom_realisateur, prenom_realisateur) values
(p_nom_realisateur, p_prenom_realisateur);
end;
$$;

-- appeler la procedure
call create_realisateur('John', 'Doe');

-- creer un film 
create or replace procedure create_film(
    in p_titre varchar(250),
    in p_date_sortie_film date,
    in p_duree time,
    in p_id_realisateur uuid
)
language plpgsql 
as $$ 
begin 
insert into film (titre,date_sortie_film,duree,id_realisateur) values
(p_titre, p_date_sortie_film,p_duree, p_id_realisateur);
end;
$$;