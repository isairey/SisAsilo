USE TC2007B;

/*POBLAR LA BD*/

/*IMPORTANTE EJECUTAR EL QUERIE DE UPDATE EDAD PACIENTE*/

INSERT INTO Autorizacion
values
    ('Paciente', 'correo1@hotmail.com', 'contraseña1', 'Franco', 'Sotomayo', 'Casale', GETDATE(), '1'),
    ('Medico', 'correo2@hotmail.com', 'contraseña2', 'Jose Gerardo', 'Cantú', 'García', GETDATE(), '1'),
    ('Administrador', 'correo3@hotmail.com', 'contraseña3', 'Romel Aldair', 'Vázquez', 'Molina', GETDATE(), '1'),
    ('Paciente', 'correo4@hotmail.com', 'contraseña4', 'Marcelo', 'Marquez', 'Murillo', GETDATE(), '1'),
    ('Medico', 'correo5@hotmail.com', 'contraseña5', 'Edgar Alexandro', 'Castillo', 'Palacios', GETDATE(), '1'),
    ('Paciente', 'correo6@hotmail.com', 'contraseña6', 'Isaias', 'Reyes', 'Flores', GETDATE(), '1'),
    ('Paciente', 'correo7@hotmail.com', 'contraseña7', 'Rubén', 'Ruiz', 'Calva', GETDATE(), '1')

INSERT INTO Administrador
values
    (GETDATE(), '1', 3)

INSERT INTO Imagen 
VALUES
    ('ImagenMedicoID2', 'https://i.pinimg.com/236x/3e/43/5f/3e435f79e723b003a2b3c042fed9498f--lab-coats-male-man.jpg' ,GETDATE(), '1'),
    ('ImagenMedicoID5', 'https://i.pinimg.com/236x/5c/bf/30/5cbf305b7acf4f3349589b0eaae92658.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID1.1', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/03/09/16468231897426.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID1.2', 'https://www.mexicodesconocido.com.mx/sites/default/files/nodes/inline/cerro-silla-monterrey-ecoturismo.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID4.1', 'https://fondosmil.com/fondo/70849.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID4.2', 'https://viajes.nationalgeographic.com.es/medio/2019/03/29/torre-eiffel-hoy_f7a97d88_1200x1821.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID6.1', 'https://concepto.de/wp-content/uploads/2015/08/familia-extensa-e1591818025158-800x400.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID6.2', 'https://i.blogs.es/c68014/casa-3d/840_560.jpeg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID7.1', 'https://imagenes.elpais.com/resizer/ZOsnsg1sVLkAkXkLjsjBP9QbJZw=/1960x1470/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/D3KH5JXN53G4LTNQGCQUKB4ODU.jpg' ,GETDATE(), '1'),
    ('ImagenImagenPacienteID7.2', 'https://http2.mlstatic.com/D_NQ_NP_928378-MLM41491794299_042020-O.jpg' ,GETDATE(), '1'),
    ('ImagenPacienteID1', 'https://thumbs.dreamstime.com/b/icono-de-tratamiento-del-paciente-vector-perfil-persona-masculina-s%C3%ADmbolo-avatar-para-el-m%C3%A9dico-en-pictograma-glifo-color-plano-146789727.jpg' ,GETDATE(), '1'),
    ('ImagenPacienteID4', 'https://www.nacion.com/resizer/kyCywk6Gfe1w6wBly1_N2_tXVhc=/600x0/center/middle/filters:quality(100)/cloudfront-us-east-1.images.arcpublishing.com/gruponacion/V76PQ2KSCRG7DL4LVLTOISZTLI.jpg' ,GETDATE(), '1'),
    ('ImagenPacienteID6', 'https://blogs.funiber.org/wp-content/uploads/2016/04/2-perfil-ancianos.jpg' ,GETDATE(), '1'),
    ('ImagenPacienteID7', 'https://us.123rf.com/450wm/fizkes/fizkes2002/fizkes200200453/139912860-cerrar-retrato-de-tiro-en-la-cabeza-del-hombre-maduro-sonriente-sentarse-en-el-sof%C3%A1-en-casa-mirar-a-.jpg?ver=6' ,GETDATE(), '1'),
    ('ImagenLineaDeAtencionID1', 'https://psgestalt.cl/wp-content/uploads/2020/06/Perfil.jpg' ,GETDATE(), '1'),
    ('ImagenLineaDeAtencionID2', 'https://www.gob.mx/cms/uploads/article/main_image/25704/iman_2.jpg' ,GETDATE(), '1'),
    ('ImagenLineaDeAtencionID3', 'http://colepsi.nl/wp-content/uploads/2016/07/13001129_493355254207120_2915847144649364902_n-300x300.png' ,GETDATE(), '1'),
    ('ImagenTrofeoID1', 'https://uxwing.com/wp-content/themes/uxwing/download/sport-and-awards/achievement-award-medal-icon.png' ,GETDATE(), '1'),
    ('ImagenTrofeoID2', 'https://cdn-icons-png.flaticon.com/512/1378/1378582.png' ,GETDATE(), '1'),
    ('ImagenTrofeoID3', 'https://cdn2.iconfinder.com/data/icons/business-solid-strawberry-economy/512/goal-512.png' ,GETDATE(), '1'),
    ('ImagenTrofeoID4', 'https://longevitta.mx/wp-content/uploads/2019/06/cropped-BANNER-LONGEVITTA-APROBADO-1.jpg' ,GETDATE(), '1')


INSERT INTO Medico
VALUES
    ('Hospital 1', GETDATE(), '1', 2, 1),
    ('Hospital 2', GETDATE(), '1', 5, 2)
    
INSERT INTO Grupo
VALUES
    ('Grupo 1', GETDATE(), '1'),
    ('Grupo 2', GETDATE(), '1')


INSERT INTO Zona
VALUES
    ('Zona 1', GETDATE(), '1',1),
    ('Zona 2', GETDATE(), '1',1),
    ('Zona 3', GETDATE(), '1',2),
    ('Zona 4', GETDATE(), '1',2)

INSERT INTO Decanato
VALUES
    ('Decanato 1', GETDATE(), '1',1),
    ('Decanato 2', GETDATE(), '1',1),
    ('Decanato 3', GETDATE(), '1',2),
    ('Decanato 4', GETDATE(), '1',2),
    ('Decanato 5', GETDATE(), '1',3),
    ('Decanato 6', GETDATE(), '1',3),
    ('Decanato 7', GETDATE(), '1',4),
    ('Decanato 8', GETDATE(), '1',4)

INSERT INTO Parroquia
VALUES
    ('Parroquia 1', GETDATE(), '1',1),
    ('Parroquia 2', GETDATE(), '1',1),
    ('Parroquia 3', GETDATE(), '1',2),
    ('Parroquia 4', GETDATE(), '1',2),
    ('Parroquia 5', GETDATE(), '1',3),
    ('Parroquia 6', GETDATE(), '1',3),
    ('Parroquia 7', GETDATE(), '1',4),
    ('Parroquia 8', GETDATE(), '1',4),
    ('Parroquia 9', GETDATE(), '1',5),
    ('Parroquia 10', GETDATE(), '1',5),
    ('Parroquia 11', GETDATE(), '1',6),
    ('Parroquia 12', GETDATE(), '1',6),
    ('Parroquia 13', GETDATE(), '1',7),
    ('Parroquia 14', GETDATE(), '1',7),
    ('Parroquia 15', GETDATE(), '1',8),
    ('Parroquia 16', GETDATE(), '1',8)


INSERT INTO Examen
    VALUES
        ('Índice de Katz','KATZ','Funcionalidad',GETDATE(), '1'),
        ('Índice de Lawton & Brody','LW&B','Funcionalidad',GETDATE(), '1'),
        ('Escala Abreviada de Depresión Geriátrica de Yesavage','ADGY','Afectivo',GETDATE(), '1'),
        ('Mini Mental State Examination de Folstein (MMSE-30)','MMSE','Cognitiva',GETDATE(), '1'),
        ('Prueba de reloj','PR','Cognitiva',GETDATE(), '1'),
        ('Escala Sarc-F','SARC-F','Desempeño Físico',GETDATE(), '1'),
        ('Escala de valoración sociofamiliar de Gijón','VSG','Riesgo Social',GETDATE(), '1'),
        ('Short Physical Performance Battery (Sppb)','SPPB','Desempeño Físico',GETDATE(), '1'),
        ('Clinical Fraility Scale','CFS','Desempeño Físico',GETDATE(), '1')
        
INSERT INTO Respuesta
    VALUES
    /*INDICE KATZ*/
        ('No recibe ayuda', 1 ,GETDATE(), '1'),
        ('Recibe ayuda con una parte del cuerpo', 0.5 ,GETDATE(), '1'),
        ('Recibe ayuda con más de una parte', 0.5 ,GETDATE(), '1'),
        ('No se baña', 0 ,GETDATE(), '1'),

        ('Se viste solo', 1 ,GETDATE(), '1'),
        ('Requiere ayuda para los zapatos', 0.5 ,GETDATE(), '1'),
        ('Recibe ayuda para el vestido', 0.5 ,GETDATE(), '1'),
        ('No se viste', 0 ,GETDATE(), '1'),

        ('Va solo y se arregla', 1 ,GETDATE(), '1'),
        ('Recibe ayuda para ir y asearse', 0.5 ,GETDATE(), '1'),
        ('No va al servicio', 0 ,GETDATE(), '1'),

        ('Se levante y se acuesta solo', 1 ,GETDATE(), '1'),
        ('Necesita ayuda', 0.5 ,GETDATE(), '1'),
        ('No puede salir de cama', 0 ,GETDATE(), '1'),

        ('Come solo con cubiertos', 1 ,GETDATE(), '1'),
        ('Requiere ayuda', 0.5 ,GETDATE(), '1'),
        ('Requiere ayuda total', 0 ,GETDATE(), '1'),
        ('Come por medio de una sonda', 0 ,GETDATE(), '1'),

        ('Contiene todo el día y noche', 1 ,GETDATE(), '1'),
        ('Incontinencia ocasional nocturna', 0.5 ,GETDATE(), '1'),
        ('Incontinencia permanente', 0 ,GETDATE(), '1'),

    /*Indice de Lawton & Brody*/
        ('Lo usa por iniciativa propia', 1 ,GETDATE(), '1'),
        ('Marca solo números conocidos', 1 , GETDATE(), '1'),
        ('Contesta, pero no marca números', 1 ,GETDATE(), '1'),
        ('No usa el teléfono', 0 ,GETDATE(), '1'),

        ('Vigila sus necesidades independientemente', 1 ,GETDATE(), '1'),
        ('Realiza independientemente pequeñas compras', 0 ,GETDATE(), '1'),
        ('Necesita ir acompañado para hacer cualquier compra', 0 ,GETDATE(), '1'),
        ('Totalmente incapaz de comprar', 0 ,GETDATE(), '1'),

        ('Organiza, prepara y sirve las comidas por sí solo adecuadamente', 1 ,GETDATE(), '1'),
        ('Prepara adecuadamente las comidas si se le proporcionan los ingredientes', 0 ,GETDATE(), '1'),
        ('Prepara, calienta y sirve las comidas, pero no sigue una dieta adecuada', 0 ,GETDATE(), '1'),
        ('Necesita que le preparen y sirvan las comidas', 0 ,GETDATE(), '1'),

        ('Mantiene la casa solo o con ayuda ocasional (para trabajos pesados)', 1 ,GETDATE(), '1'),
        ('Realiza tareas ligeras, como lavar los platos o hacer las camas', 1 ,GETDATE(), '1'),
        ('Realiza tareas ligeras, pero no puede mantener un adecuado nivel de limpieza', 1 ,GETDATE(), '1'),
        ('Necesita ayuda en todas las labores de la casa', 1 ,GETDATE(), '1'),
        ('No participa en ninguna labor de la casa', 0 ,GETDATE(), '1'),

        ('Lava por sí solo toda su ropa', 1 ,GETDATE(), '1'),
        ('Lava por sí solo pequeñas prendas', 1 ,GETDATE(), '1'),
        ('Todo el lavado de ropa debe ser realizado por otro', 0 ,GETDATE(), '1'),

        ('Viaja solo en transporte público o conduce su propio coche', 1 ,GETDATE(), '1'),
        ('Es capaz de tomar un taxi, pero no usa otro medio de transporte', 1 ,GETDATE(), '1'),
        ('Viaja en transporte público cuando va acompañado por otra persona', 1 ,GETDATE(), '1'),
        ('Sólo utiliza el taxi o el automóvil con ayuda de otros', 0 ,GETDATE(), '1'),
        ('No viaja', 0 ,GETDATE(), '1'),

        ('Es capaz de tomar su medicación a la hora y con la dosis correcta', 1 ,GETDATE(), '1'),
        ('Toma su medicación si la dosis le es preparada previamente', 0 ,GETDATE(), '1'),
        ('No es capaz de administrsrse su medicación', 0 ,GETDATE(), '1'),

        ('Se encarga de sus asuntos económicos por sí solo', 1 ,GETDATE(), '1'),
        ('Realiza las compras de cada día, pero necesita ayuda en las grandes compras', 1 ,GETDATE(), '1'),
        ('Incapaz de manejar dinero', 0 ,GETDATE(), '1'),

    /*Escala Abreviada de Depresión Geriátrica Deyesavage*/
        ('Si', 0 ,GETDATE(), '1'), /*1,5,7,11,13*/
        ('No', 1 ,GETDATE(), '1'),

        ('Si', 1 ,GETDATE(), '1'), /*2-4,6,8-10,12,14-15*/
        ('No', 0 ,GETDATE(), '1'),
        

    /*Mini Mental State Examination de Folstein (MMSE-30)*/
    /*Las respuestas tienen que ser evaluadas*/

    /*Prueba de reloj*/
    /*Las respuestas tienen que ser evaluadas*/

    /*Escala Sarc-F Versión En Español – México*/

        ('Ninguna', 0 ,GETDATE(), '1'), /*Todas*/
        ('Alguna', 1 ,GETDATE(), '1'), /*1-4*/
        ('Mucha o incapaz', 2 ,GETDATE(), '1'),

        ('1 a 3 caídas', 1 ,GETDATE(), '1'), /*5*/
        ('4 o más caídas', 2 ,GETDATE(), '1'),

    /*Escala de valoración sociofamiliar de Gijón*/
        ('Vive con pareja y/o familia sin conflictos', 1 ,GETDATE(), '1'),
        ('Vive con pareja de edad similar', 2 ,GETDATE(), '1'),
        ('Vive con pareja y/o familia y/o otros, pero no pueden o no quieren atenderlo', 3 ,GETDATE(), '1'),
        ('Vive solo, hijos y/o familiares próximos que no cubren todas las necesidades', 4 ,GETDATE(), '1'),
        ('Vive solo, familia lejana, desatendido, sin familia', 5 ,GETDATE(), '1'),

        ('Mantiene relaciones sociales fuera del domicilio', 1 ,GETDATE(), '1'),
        ('Sólo se relaciona con familia/vecinos/otros, sale de casa', 2 ,GETDATE(), '1'),
        ('Sólo se relaciona con familia, sale de casa', 3 ,GETDATE(), '1'),
        ('No sale de su domicilio, recibe familia o visitas (> 1 por semana)', 4 ,GETDATE(), '1'),
        ('No sale del domicilio, ni recibe visitas (< 1 por semana)', 5 ,GETDATE(), '1'),

        ('No necesita ningún apoyo', 1 ,GETDATE(), '1'),
        ('Recibe apoyo de la familia y/o vecinos', 2 ,GETDATE(), '1'),
        ('Recibe apoyo social formal suficiente (centro de día, trabajador/familiar, vive en residencia, etc.)', 3 ,GETDATE(), '1'),
        ('Tiene soporte social pero es insuficiente', 4 ,GETDATE(), '1'),
        ('No tiene ningún soporte social y lo necesita', 5 ,GETDATE(), '1'),

    /*Short Physical Performance Battery (Sppb)*/
    /*Las respuestas tienen que ser evaluadas*/

    /*Clinical Fraility Scale*/
        ('Muy en Forma', 1 ,GETDATE(), '1'),
        ('En forma', 2 ,GETDATE(), '1'),
        ('Bien', 3 ,GETDATE(), '1'),
        ('Viviendo con una leve fragilidad', 4 ,GETDATE(), '1'),
        ('Viviendo con fragilidad', 5 ,GETDATE(), '1'),
        ('Viviendo con fragilidad moderada', 6 ,GETDATE(), '1'),
        ('Viviendo con fragilidad severa', 7 ,GETDATE(), '1'),
        ('Viviendo con fragilidad muy severa', 8 ,GETDATE(), '1'),
        ('Enfermedad terminal', 9 ,GETDATE(), '1')

INSERT INTO Pregunta
VALUES
    /*INDICE KATZ*/
    ('A la hora de bañarse usted...', GETDATE(), '1', 1),
    ('Cuando usted se va a vestir...', GETDATE(), '1', 1),
    ('Para ir al sanitario...', GETDATE(), '1', 1),
    ('Cuando usted se levanta...', GETDATE(), '1', 1),
    ('A la hora de comer...', GETDATE(), '1', 1),
    ('¿Que tan a menudo tiene continencias?', GETDATE(), '1', 1),

    /*Índice de Lawton & Brody*/
    ('Respecto al uso del teléfono', GETDATE(), '1', 2),
    ('Cuando va a realizar las compras...', GETDATE(), '1', 2),
    ('Para prepara la comida...', GETDATE(), '1', 2),
    ('Respecto al cuidado del hogar', GETDATE(), '1', 2),
    ('Cuando debe de lavar ropa...', GETDATE(), '1', 2),
    ('Para el uso de medios de transporte...', GETDATE(), '1', 2),
    ('Con respecto a su medicación', GETDATE(), '1', 2),
    ('Para sus asuntos economicos...', GETDATE(), '1', 2),

    /*Escala Abreviada de Depresión Geriátrica*/
    ('¿Está usted satisfecho con su vida?', GETDATE(), '1', 3),
    ('¿Ha abandonado sus actividades e intereses?', GETDATE(), '1', 3),
    ('¿Siente su vida vacía?', GETDATE(), '1', 3),
    ('¿Se aburre a menudo?', GETDATE(), '1', 3),
    ('¿Se encuentra de buen humor la mayor parte del tiempo?', GETDATE(), '1', 3),
    ('¿Teme que algo malo le ocurra?', GETDATE(), '1', 3),
    ('¿Esta usted feliz la mayor parte del tiempo?', GETDATE(), '1', 3),
    ('¿A menudo siente que su situación no tiene remedio?', GETDATE(), '1', 3),
    ('¿Prefiere quedarse en casa que salir?', GETDATE(), '1', 3),
    ('¿Cree que tiene más problemas de memoria que otro?', GETDATE(), '1', 3),
    ('¿Piensa que es maravilloso vivir?', GETDATE(), '1', 3),
    ('¿Se siente inutil?', GETDATE(), '1', 3),
    ('¿Se siente lleno de energia?', GETDATE(), '1', 3),
    ('¿Ha perdido toda la esperanza?', GETDATE(), '1', 3),
    ('¿Piensa que los demás están mejor que usted?', GETDATE(), '1', 3),

    /*Mini Mental State Examination de Folstein (MMSE-30)*/
    ('Por favor determine la fecha y estación actual', GETDATE(), '1', 4),
    ('Por favor determine donde se encuentra', GETDATE(), '1', 4),
    ('Repita estas 3 palabras hasta aprenderlas: Caballo, Manzana y Centavo', GETDATE(), '1', 4),
    ('Por favor reste de 7 en 7 empezando en 100', GETDATE(), '1', 4),
    ('¿Recuerda las 3 palabras que se mencionaron anteriormente?', GETDATE(), '1', 4),
    ('Repita la frase: "NI NO, NI SI, NI PERO"', GETDATE(), '1', 4),
    ('Tome un papel con la mano derecha, doblelo y colóquelo sobre el escritorio.', GETDATE(), '1', 4),
    ('Lea y haga lo siguiente "CIERRA LOS OJOS"', GETDATE(), '1', 4),
    ('Escriba una frase:', GETDATE(), '1', 4),
    ('Copie este dibujo (Mostrar la figura)', GETDATE(), '1', 4),


    /*Prueba de Reloj*/
    ('Siéntese en una silla levántese y camine 3 metros gire y vuelva a sentarse', GETDATE(), '1', 5),

    /*Escala Sarc-F Versión En Español – México*/
    ('¿Qué tanta dificultad tiene para llevar o cargar 4 o 5 kilogramos?', GETDATE(), '1', 6),
    ('¿Qué tanta dificultad tiene para cruzar caminando un cuarto?', GETDATE(), '1', 6),
    ('¿Qué tanta dificultad tiene para levantarse de una silla o cama?', GETDATE(), '1', 6),
    ('¿Qué tanta dificultad tiene para subir 10 escalones?', GETDATE(), '1', 6),
    ('¿Cuántas veces se ha caído en el ultimo año?', GETDATE(), '1', 6),

    /*Escala de valoración sociofamiliar de Gijón*/
    ('Elija la que mejor describa su situación familiar', GETDATE(), '1', 7),
    ('Elija la que mejor describa sus relaciones y contactos sociales', GETDATE(), '1', 7),
    ('Elija la que mejor describa sus apoyos red social', GETDATE(), '1', 7),

    /*Short Physical Performance Battery (Sppb)*/
    ('Pies juntos en posición paralela por 10 segundos', GETDATE(), '1', 8),
    ('Posición semi-tandem el talon de un pie contra el dedo grande del otro durante 10 segundos', GETDATE(), '1', 8),
    ('Posición tandem el talon contra el dedo grande con los pies alineados durante 10 segundos', GETDATE(), '1', 8),
    ('Medir el tiempo que le toma levantarse de la silla sin usar los brazos', GETDATE(), '1', 8),
    ('Caminar 6 metros cronometrado', GETDATE(), '1', 8),


    /*Clinical Fraility Scale*/
    ('Evaluador seleccione una escala', GETDATE(), '1', 9)


/*DUDA DE COMO FUNCIONA ESTA TABLA Y COMO SE RELACIONA CON LAS PREGUNTAS*/
INSERT INTO RangoDeExamen
VALUES
    (0,0,'Dependencia Total',3 ,GETDATE(), '1',1), /*INDICE KATZ, 6 ES BUENO Y 0 ES MALO*/ /**/
    (5,1, 'Dependencia' ,2,GETDATE(), '1',1), /**/
    (6,6, 'Independencia' ,1,GETDATE(), '1',1),   /**/

    (1,0,'Dependencia Total',3,GETDATE(), '1',2), /*ESCALA DE LAWTON Y BRODY 8 ES BUENO Y 0 ES MALO, AUNQUE EN HOMBRES PUEDE SER 5 MAXIMO*/ /**/
    (3,2, 'Dependencia grave',3,GETDATE(), '1',2), /**/
    (5,4, 'Dependencia moderada' ,2,GETDATE(), '1',2), /**/
    (7,6, 'Dependencia ligera' ,1,GETDATE(), '1',2), /**/
    (8,8, 'Autonomía' ,1,GETDATE(), '1',2), /**/

    (5,0, 'Normal' ,1,GETDATE(), '1',3),  /*Escala Abreviada de Depresión Geriátrica Deyesavage, 0 ES BUENO Y 15 ES MALO*/ /**/
    (9,6, 'Depresión leve' ,2,GETDATE(), '1',3), /**/
    (10,15, 'Depresión establecida' ,3,GETDATE(), '1',3), /**/

    (5,0, 'Deterioro cognitivo severo' ,3,GETDATE(), '1',4), /*Mini Mental de Folstein (MMSE), 30 ES BUENO Y 0 ES MALO*/ /**/
    (9,6, 'Existe un deterioro cognitivo de moderado a severo' ,3,GETDATE(), '1',4), /**/
    (24,10, 'Existe un deterioro cognitivo de leve a moderado' ,2,GETDATE(), '1',4), /**/
    (26,25, 'Pudiera existir un posible deterioro cognitivo' ,1,GETDATE(), '1',4), /**/
    (30,27, 'No existe deterioro cognitivo' ,1,GETDATE(), '1',4), /**/

    (10,0, 'Normal' ,1,GETDATE(), '1',5), /*Prueba del Reloj abajo de 10 es lo mejor y más de 20 es malo*/ /**/
    (11,20, 'Riesgo leve' ,2,GETDATE(), '1',5), /**/
    (20,999, 'Riesgo alto' ,3,GETDATE(), '1',5), /**/

    (4,0, 'Normal' ,1,GETDATE(), '1',6), /*Escala Sarc F donde 4 o menos es bueno y arriba de 4 es malo*/ /**/
    (4,10, 'Sarcopenia',3,GETDATE(), '1',6), /**/

    (7,0, 'Bajo Riesgo' ,1,GETDATE(), '1',7), /*Prueba de Gijón donde 4 o menos es bueno y arriba de 4 es malo*/ /**/
    (9,8, 'Riesgo Medio' ,2,GETDATE(), '1',7), /**/
    (15,10, 'Riesgo Alto' ,3,GETDATE(), '1',7), /**/

    (7,0, 'Desempeño físico bajo' ,3,GETDATE(), '1',8), /*Short Physical Performance Battery (Sppb) donde 7 o menos es malo y arriba de 8 es bueno*/ /**/
    (8,10, 'Buen desempeño físico' ,1,GETDATE(), '1',8), /**/

    (1,1, 'Muy en Forma' ,1,GETDATE(), '1',9), /*Clinical Fraility Scale cfs, 1 ES BUENO Y 9 ES MALO*/ /**/
    (2,2, 'En forma' ,1,GETDATE(), '1',9), /**/
    (3,3, 'Bien' ,1,GETDATE(), '1',9), /**/
    (4,4, 'Viviendo con una leve fragilidad',2,GETDATE(), '1',9), /**/
    (5,5, 'Viviendo con fragilidad',2,GETDATE(), '1',9), /**/
    (6,6, 'Viviendo con fragilidad moderada' ,2,GETDATE(), '1',9), /**/
    (7,7, 'Viviendo con fragilidad severa',3,GETDATE(), '1',9), /**/
    (8,8, 'Viviendo con fragilidad muy severa',3,GETDATE(), '1',9), /**/
    (9,9, 'Enfermedad terminal',3,GETDATE(), '1',9) /**/


/*DUDA SUPONGO QUE ESTO SIRVE ASÍ, SOLO VERIFICAR ESO*/
INSERT INTO PreguntaRespuesta
VALUES
    /*INDICE KATZ*/
    (GETDATE(), '1', 1, 1),
    (GETDATE(), '1', 1, 2),
    (GETDATE(), '1', 1, 3),
    (GETDATE(), '1', 1, 4),

    (GETDATE(), '1', 2, 5),
    (GETDATE(), '1', 2, 6),
    (GETDATE(), '1', 2, 7),
    (GETDATE(), '1', 2, 8),

    (GETDATE(), '1', 3, 9),
    (GETDATE(), '1', 3, 10),
    (GETDATE(), '1', 3, 11),

    (GETDATE(), '1', 4, 12),
    (GETDATE(), '1', 4, 13),
    (GETDATE(), '1', 4, 14),

    (GETDATE(), '1', 5, 15),
    (GETDATE(), '1', 5, 16),
    (GETDATE(), '1', 5, 17),
    (GETDATE(), '1', 5, 18),

    (GETDATE(), '1', 6, 19),
    (GETDATE(), '1', 6, 20),
    (GETDATE(), '1', 6, 21),

    

    /*ESCALA DE LAWTON Y BRODY */
    (GETDATE(), '1', 7, 22),
    (GETDATE(), '1', 7, 23),
    (GETDATE(), '1', 7, 24),
    (GETDATE(), '1', 7, 25),

    (GETDATE(), '1', 8, 26),
    (GETDATE(), '1', 8, 27),
    (GETDATE(), '1', 8, 28),
    (GETDATE(), '1', 8, 29),

    (GETDATE(), '1', 9, 30),
    (GETDATE(), '1', 9, 31),
    (GETDATE(), '1', 9, 32),
    (GETDATE(), '1', 9, 33),

    (GETDATE(), '1', 10, 34),
    (GETDATE(), '1', 10, 35),
    (GETDATE(), '1', 10, 36),
    (GETDATE(), '1', 10, 37),
    (GETDATE(), '1', 10, 38),

    (GETDATE(), '1', 11, 39),
    (GETDATE(), '1', 11, 40),
    (GETDATE(), '1', 11, 41),

    (GETDATE(), '1', 12, 42),
    (GETDATE(), '1', 12, 43),
    (GETDATE(), '1', 12, 44),
    (GETDATE(), '1', 12, 45),
    (GETDATE(), '1', 12, 46),

    (GETDATE(), '1', 13, 47),
    (GETDATE(), '1', 13, 48),
    (GETDATE(), '1', 13, 49),

    (GETDATE(), '1', 14, 50),
    (GETDATE(), '1', 14, 51),
    (GETDATE(), '1', 14, 52),


    /*Escala Abreviada de Depresión Geriátrica Deyesavage*/

    (GETDATE(), '1', 15, 53),
    (GETDATE(), '1', 15, 54),

    (GETDATE(), '1', 16, 55),
    (GETDATE(), '1', 16, 56),

    (GETDATE(), '1', 17, 55),
    (GETDATE(), '1', 17, 56),

    (GETDATE(), '1', 18, 55),
    (GETDATE(), '1', 18, 56),
    
    (GETDATE(), '1', 19, 53),
    (GETDATE(), '1', 19, 54),

    (GETDATE(), '1', 20, 55),
    (GETDATE(), '1', 20, 56),

    (GETDATE(), '1', 21, 53),
    (GETDATE(), '1', 21, 54),

    (GETDATE(), '1', 22, 55),
    (GETDATE(), '1', 22, 56),

    (GETDATE(), '1', 23, 55),
    (GETDATE(), '1', 23, 56),

    (GETDATE(), '1', 24, 55),
    (GETDATE(), '1', 24, 56),
    
    (GETDATE(), '1', 25, 53),
    (GETDATE(), '1', 25, 54),

    (GETDATE(), '1', 26, 55),
    (GETDATE(), '1', 26, 56),

    (GETDATE(), '1', 27, 53),
    (GETDATE(), '1', 27, 54),

    (GETDATE(), '1', 28, 55),
    (GETDATE(), '1', 28, 56),

    (GETDATE(), '1', 29, 55),
    (GETDATE(), '1', 29, 56),

    /*Mini Mental State Examination de Folstein (MMSE-30)*/
    /*Aqui cada respuesta debe de agregarla el doctor*/


    /*Prueba del Reloj*/
    /*Aqui cada respuesta debe de agregarla el doctor*/


    /*Escala Sarc F*/
    (GETDATE(), '1', 41, 57),
    (GETDATE(), '1', 41, 58),
    (GETDATE(), '1', 41, 59),

    (GETDATE(), '1', 42, 57),
    (GETDATE(), '1', 42, 58),
    (GETDATE(), '1', 42, 59),

    (GETDATE(), '1', 43, 57),
    (GETDATE(), '1', 43, 58),
    (GETDATE(), '1', 43, 59),

    (GETDATE(), '1', 44, 57),
    (GETDATE(), '1', 44, 58),
    (GETDATE(), '1', 44, 59),

    (GETDATE(), '1', 45, 57),
    (GETDATE(), '1', 45, 60),
    (GETDATE(), '1', 45, 61),

    /*Prueba de Gijón*/
    (GETDATE(), '1', 46, 62),
    (GETDATE(), '1', 46, 63),
    (GETDATE(), '1', 46, 64),
    (GETDATE(), '1', 46, 65),
    (GETDATE(), '1', 46, 66),

    (GETDATE(), '1', 47, 67),
    (GETDATE(), '1', 47, 68),
    (GETDATE(), '1', 47, 69),
    (GETDATE(), '1', 47, 70),
    (GETDATE(), '1', 47, 71),

    (GETDATE(), '1', 48, 72),
    (GETDATE(), '1', 48, 73),
    (GETDATE(), '1', 48, 74),
    (GETDATE(), '1', 48, 75),
    (GETDATE(), '1', 48, 76),


    /*Short Physical Performance Battery (Sppb)*/
    /*Las respuestas las pone el doc*/

    /*Clinical Fraility Scale cfs*/
    (GETDATE(), '1', 54, 77),
    (GETDATE(), '1', 54, 78),
    (GETDATE(), '1', 54, 79),
    (GETDATE(), '1', 54, 80),
    (GETDATE(), '1', 54, 81),
    (GETDATE(), '1', 54, 82),
    (GETDATE(), '1', 54, 83),
    (GETDATE(), '1', 54, 84),
    (GETDATE(), '1', 54, 85)


INSERT INTO LineaDeAtencion
    VALUES
    ('8112731886','Psicologo','Joshua González','Cam. de los Quetzales 550, San Jeronimo, Monterrey',GETDATE(), '1', 15),
    ('911','Atención de Emergencias','Número de Emergencia Nacional','Sin ubicación',GETDATE(), '1', 16),
    ('3318146080','Asociación de Psicólogos','Psicólogos en Monterrey','Los Pinos 2512, Villa Florida, Monterrey',GETDATE(), '1', 17)

INSERT INTO Paciente
    VALUES
    ('M', 80.5, 178, 'B+', '1960-08-20', GETDATE(), '1', 62, 1, 1, 12, 11),
    ('F', 78.6, 164, 'AB+', '1955-10-02', GETDATE(), '1', 67, 4, 1, 15, 12),
    ('M', 50, 158, 'A-', '1940-09-21', GETDATE(), '1', 82, 6, 2, 1, 13),
    ('M', 65.3, 160, 'O-', '1955-01-08', GETDATE(), '1', 67,7, 2, 5, 14)

INSERT INTO ExamenPaciente
    VALUES
    (4, '2022-09-20', 'Salud Digna', 'Ramon Marquez', GETDATE(), '1', 1, 1),
    (3, '2022-09-26', 'Centro de Salud NL', 'Daniela Ramos', GETDATE(), '1', 1, 1),
    (5, '2020-09-20', 'Salud Digna', 'Rocio Marquez', GETDATE(), '1', 2, 9),
    (4, '2021-09-20', 'Salud Digna', 'Rocio Marquez', GETDATE(), '1', 2, 9),
    (9, '2020-10-28', 'Salud Digna', 'Andres Salvador', GETDATE(), '1', 3, 7),
    (14, '2021-11-28', 'Hospital Sur', 'Aurora Velazquez', GETDATE(), '1', 3, 7),
    (14, '2020-10-28', 'Salud Digna', 'Andres Salvador', GETDATE(), '1', 4, 7),
    (9, '2021-11-28', 'Hospital Sur', 'Aurora Velazquez', GETDATE(), '1', 4, 7)

INSERT INTO Trofeo
    VALUES
    ('30 acciones','Completa 30 acciones de la lista de tareas diarias', GETDATE(), '1', 18),
    ('300 acciones','Completa 300 acciones de la lista de tareas diarias', GETDATE(), '1', 19),
    ('Mis primeras 3','Completa las 3 acciones de la lista de tareas diarias', GETDATE(), '1', 20),
    ('El inicio de más actividades', 'Accede por primera vez al sitio de Longevitta.mx desde esta aplicación', GETDATE(), '1', 21)

INSERT INTO TrofeoPaciente
    VALUES
    ('0', GETDATE(), '1', 1,1),
    ('0', GETDATE(), '1', 1,2),
    ('0', GETDATE(), '1', 1,3),
    ('0', GETDATE(), '1', 1,4),
    ('0', GETDATE(), '1', 2,1),
    ('0', GETDATE(), '1', 2,2),
    ('0', GETDATE(), '1', 2,3),
    ('0', GETDATE(), '1', 2,4),
    ('0', GETDATE(), '1', 3,1),
    ('0', GETDATE(), '1', 3,2),
    ('0', GETDATE(), '1', 3,3),
    ('0', GETDATE(), '1', 3,4),
    ('0', GETDATE(), '1', 4,1),
    ('0', GETDATE(), '1', 4,2),
    ('0', GETDATE(), '1', 4,3),
    ('0', GETDATE(), '1', 4,4)

INSERT INTO Accion
    VALUES
    ('Social','Contacta a uno de tus seres queridos',GETDATE(), '1'),
    ('Bienestar Personal','Haz 10 minutos de ejercicio',GETDATE(), '1'),
    ('Tiempo de Ocio','Realizar un pasatiempo, por ejemplo: jugar ajedrez, ver la tele, cocinar, contar una historia, hacer un sudoku, etc',GETDATE(), '1'),
    ('Aseo Personal','Toma una ducha de agua caliente',GETDATE(), '1'),
    ('Bienestar Personal','Toma una siesta de 30 minutos',GETDATE(), '1'),
    ('Bienestar Personal','Cocina una receta de cocina de tu gusto',GETDATE(), '1'),
    ('Bienestar Persona','Medita durante 30 minutos',GETDATE(), '1'),
    ('Cultura','Lee un capítulo de un libro',GETDATE(), '1'),
    ('Cuidado del Hogar','Ilumina adecuadamente tu espacio',GETDATE(), '1'),
    ('Cuidado del Hogar','Barre y trapea tu espacio',GETDATE(), '1'),
    ('Social','Saluda a tus vecinos',GETDATE(), '1'),
    ('Social','Dale las "gracias" a una persona',GETDATE(), '1')

INSERT INTO AccionPaciente
    VALUES
    ('0', GETDATE(), '1', 1, 1),
    ('0', GETDATE(), '1', 1, 2),
    ('0', GETDATE(), '1', 1, 3),
    ('0', GETDATE(), '1', 2, 5),
    ('0', GETDATE(), '1', 2, 2),
    ('0', GETDATE(), '1', 2, 6),
    ('0', GETDATE(), '1', 3, 4),
    ('0', GETDATE(), '1', 3, 7),
    ('0', GETDATE(), '1', 3, 9),
    ('0', GETDATE(), '1', 4, 8),
    ('0', GETDATE(), '1', 4, 11),
    ('0', GETDATE(), '1', 4, 10)

INSERT into ImagenPaciente
    VALUES
        (GETDATE(), '1', 1, 11),
        (GETDATE(), '1', 2, 12),
        (GETDATE(), '1', 3, 13),
        (GETDATE(), '1', 4, 14)

INSERT into Favorito
    VALUES
        ('1', GETDATE(), '1', 1, 1),
        ('1', GETDATE(), '1', 1, 3),
        ('1', GETDATE(), '1', 2, 1),
        ('1', GETDATE(), '1', 3, 3)



/*EXEC update_siglas_examen
@examen_id = 9,
@siglas = 'CFS'*/
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 4)
BEGIN
    EXEC update_edad_paciente
    @paciente_id = @Counter
    SET @Counter  = @Counter  + 1
END




/*SELECT * FROM PreguntaRespuesta;

SELECT * FROM Respuesta;

DROP TABLE PreguntaRespuesta;

SELECT * FROM Paciente;
*/

/*
1=verde
2=amarillo
3=rojo
*/
/*EXEC update_luz
@Id_rango_de_examen = 35,
@Luz = 3*/

SELECT * FROM Paciente

/*
EXEC update_dimension_examen
@examen_id = 7,
@dimension = 'Riesgo Social'*/