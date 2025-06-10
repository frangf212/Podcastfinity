
DROP TABLE recomendaciones;
DROP TABLE valoraciones;
DROP TABLE podcast_tematica;
DROP TABLE tematicas;
DROP TABLE podcasts;
DROP TABLE usuarios;


CREATE TABLE usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre_usuario VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    contrasena VARCHAR2(100) NOT NULL
);


CREATE TABLE podcasts (
    id_podcast NUMBER PRIMARY KEY,
    titulo VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(500),
    autor VARCHAR2(100),
    fecha_creacion DATE
);

CREATE TABLE tematicas (
    id_tematica NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);


CREATE TABLE podcast_tematica (
    id_podcast NUMBER,
    id_tematica NUMBER,
    PRIMARY KEY (id_podcast, id_tematica),
    FOREIGN KEY (id_podcast) REFERENCES podcasts(id_podcast),
    FOREIGN KEY (id_tematica) REFERENCES tematicas(id_tematica)
);


CREATE TABLE valoraciones (
    id_valoracion NUMBER PRIMARY KEY,
    id_usuario NUMBER,
    id_podcast NUMBER,
    puntuacion NUMBER CHECK (puntuacion BETWEEN 1 AND 5),
    comentario VARCHAR2(500),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_podcast) REFERENCES podcasts(id_podcast)
);


CREATE TABLE recomendaciones (
    id_usuario NUMBER,
    id_podcast NUMBER,
    score_recomendado NUMBER,
    PRIMARY KEY (id_usuario, id_podcast),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_podcast) REFERENCES podcasts(id_podcast)
);



