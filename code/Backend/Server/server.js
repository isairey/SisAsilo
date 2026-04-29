const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const fs = require('fs')
const path = require('path')
const morgan = require('morgan')
const router = require('./routes/route')
const app = express()

const {PrismaClient} = require('@prisma/client')
const { poolPromise } = require('./database/db')

const prisma = new PrismaClient()

/* USAR NODEMON PARA CORRER EL SERVER EN AUTO CON CAMBIOS */
/* nodemon server.js */

app.use(express.json())

app.use(cors())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use(morgan('dev'))

// create a write stream (in append mode)
var accessLogStream = fs.createWriteStream(path.join(__dirname, '/logs/access.log'), { flags: 'a' })
 
// setup the logger
app.use(morgan('combined', { stream: accessLogStream }))
app.use(router)

app.get('/', (req, res) => {
  res.send('Hello World!')
})

const port = 3000

// app.listen(process.env.PORT || port , (err) => {
app.listen(port, () => {
  console.log('Server started running on : ' + port)
})


const  simpliyJson = function(obj){
  const simpleObj = {};
  for (let key in obj){
    const value = obj[key]
    const type = typeof value;

    if(['string', 'boolean'].includes(type) || (type === 'number' && !isNaN(value))){
      simpleObj[key] = value;
    }
    else if(type === 'object'){
      Object.assign(simpleObj, simpliyJson(value));
    }
  }
  return simpleObj;
}



app.get('/getAccesoUsuariosAPP', async(req, res)=>{
  const usuarios = await prisma.paciente.findMany(
    {
      select:{
        IdPaciente: true,
        Autorizacion:{
          select: {
            Correo: true,
            Contrasenia: true,
            Rol: true
          }
        }
      }
    }
  )
  res.json(usuarios)
})


app.get('/getAccesoMedico/:correo/:contrasenia', async(req, res)=>{
  const correo = req.params.correo
  const contrasenia = req.params.contrasenia

  console.log(String(correo), String(contrasenia))
  const usuarios = await prisma.autorizacion.findMany(
    {
      where: {Correo: String(correo), Contrasenia: String(contrasenia), Rol: "Medico"},
      select: {
        Is_active: true,
        Rol: true
      }
    }
    
  )
  
  res.json(usuarios)
})

app.get('/getAccesoAdmin/:correo/:contrasenia', async(req, res)=>{
  const correo = req.params.correo
  const contrasenia = req.params.contrasenia

  console.log(String(correo), String(contrasenia))
  const usuarios = await prisma.autorizacion.findMany(
    {
      where: {Correo: String(correo), Contrasenia: String(contrasenia), Rol: "Administrador"},
      select: {
        Is_active: true,
        Rol: true
      }
    }
    
  )
  
  res.json(usuarios)
})

app.get('/getPreguntas/:id', async(req, res)=>{
  const {id} = req.params
  const usuarios = await prisma.pregunta.findMany(
    {
      where: {IdExamen: Number(id)},
      select: {
        IdPregunta: true,
        Pregunta: true
      },
      select: {
        IdPregunta: true,
        Pregunta: true,
        PreguntaRespuesta: {
          select: {
            IdPregunta: true,
            Pregunta: true,
            Respuesta: true
          }
        }
        
      }
    }
  )
  res.json(usuarios)
})


app.get('/getPreguntasPorExamen/:id', async(req, res)=>{
  const {id} = req.params
  const usuarios = await prisma.examen.findMany(
    {
      where: {IdExamen: Number(id)},
      
      select: { 
        Nombre: true,
        Siglas: true,
        Pregunta: {
          select: {
            IdPregunta: true,
            Pregunta: true,
            PreguntaRespuesta:{
              select:{
                Respuesta:{
                  select:{
                    Respuesta:true,
                    Peso: true
                  }
                }
              }
            }
          },
        }
      }
    }
  )
  res.json(usuarios)
})

app.get('/getRespuestasPorPregunta/:id', async(req, res)=>{
  const {id} = req.params
  const usuarios = await prisma.preguntaRespuesta.findMany(
    {
      where: {IdPregunta: Number(id)},
      select: {
        Respuesta: {
          select:{
            IdRespuesta: true,
            Respuesta: true,
            Peso: true
          }
        }
      }
    }
  )
  res.json(usuarios)
})


app.get('/getLineasDeAtencion', async(req, res)=>{
  var lineas = await prisma.lineaDeAtencion.findMany(
  {
    select: {
        IdLineaDeAtencion: true,
        Titulo: true,
        Nombre: true,
        Ubicacion: true,
        Telefono: true,
        Imagen: {
          select: {
            Ubicacion: true
          }
        }
      }
  }
  )
  res.json(lineas)
})


app.get('/getUsuario/:id', async(req, res)=>{
  const {id} = req.params
  var lineas = await prisma.autorizacion.findMany(
  {
    where: {IdAutorizacion: Number(id)},
    select: {
        Nombre: true,
        ApellidoPaterno: true,
        APellidoMaterno: true,
        Paciente: {
          select: {
            IdPaciente: true,
            FechaDeNacimiento: true,
            Parroquia: {
              select: {
                Nombre: true,
                Decanato: {
                  select:{
                    Nombre: true,
                    Zona: {
                      select: {
                        Nombre: true,
                        Grupo: {
                          select: {
                            Nombre: true
                          }
                        } 
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
  }
  )
  res.json(lineas)
})

app.get('/getDatosPaciente/:id', async(req, res)=>{
  const {id} = req.params
  var auto = await prisma.paciente.findUnique(
  {
    where: {IdPaciente: Number(id)},
    include: {
        Autorizacion: {
          select: {
            Nombre: true,
            ApellidoPaterno: true,
            APellidoMaterno: true,
          }
        },
        Parroquia: {
          select:{
            Nombre: true,
            Decanato: {
              select:{
                Nombre: true,
                Zona: {
                  select:{
                    Nombre: true,
                    Grupo: {
                      select:{
                        Nombre: true
                      }
                    }
                  }
                }
              }
            }
            
          }
        
      }
      }
    }
  )
  res.json(auto)
}
)

app.get('/getParroquia/:id', async(req, res)=>{
  const {id} = req.params
  var auto = await prisma.parroquia.findMany(
  {
    where: {IdParroquia: Number(id)},
    select: {
        IdDecanato: true,
        Nombre: true,
      }
    }
  )
  res.json(auto)
}
)

app.get('/getDecanato/:id', async(req, res)=>{
  const {id} = req.params
  var auto = await prisma.decanato.findMany(
  {
    where: {IdDecanato: Number(id)},
    select: {
        IdZona: true,
        Nombre: true,
      }
    }
  )
  res.json(auto)
}
)

app.get('/getZona/:id', async(req, res)=>{
  const {id} = req.params
  var auto = await prisma.zona.findMany(
  {
    where: {IdZona: Number(id)},
    select: {
        IdGrupo: true,
        Nombre: true,
      }
    }
  )
  res.json(auto)
}
)

app.get('/getGrupo/:id', async(req, res)=>{
  const {id} = req.params
  var auto = await prisma.grupo.findMany(
  {
    where: {IdGrupo: Number(id)},
    select: {
        Nombre: true,
      }
    }
  )
  res.json(auto)
}
)

app.get('/getResultadosPorPaciente/:id_paceinte/:id_examen', async(req, res)=>{
  const id_paceinte = req.params.id_paceinte
  const id_examen = req.params.id_examen
  var auto = await prisma.examenPaciente.findMany(
  {
    where: {IdExamen: Number(id_examen), IdPaciente: Number(id_paceinte)},
    select: {
        Resultado: true,
        FechaDeExamen: true,
        Ubicacion: true,
        Evaluador: true
      }
    }
  )
  res.json(auto)
}
)

app.get('/getResultadoRecientePorPaciente/:id_paceinte/:id_examen', async(req, res)=>{
  const id_paceinte = req.params.id_paceinte
  const id_examen = req.params.id_examen
  var auto = await prisma.examenPaciente.findFirst(
  {
    where: {IdExamen: Number(id_examen), IdPaciente: Number(id_paceinte)},
    orderBy: {FechaDeExamen: 'desc'},
    select: {
        Resultado: true,
        FechaDeExamen: true,
        Ubicacion: true,
        Evaluador: true,
        Examen:{
          select:{
            Nombre: true,
            Siglas: true
          }
        }
      }
    }
  )
  res.json(auto)
}
)

app.get('/getResultadosRecientesPorPaciente/:id_paceinte', async(req, res)=>{
  const id_paceinte = req.params.id_paceinte
  var auto = await prisma.examenPaciente.findMany(
  {
    where: {IdPaciente: Number(id_paceinte)},
    orderBy: {IdPaciente: 'desc'},
    select: {
        Resultado: true,
        FechaDeExamen: true,
        Ubicacion: true,
        Evaluador: true,
        Examen:{
          select:{
            Nombre: true,
            Siglas: true,
            IdExamen: true
          }
        }
      },
      distinct: ['IdExamen']
    }
  )
  res.json(auto)
}
)

app.get('/getRandomAcciones/', async(req, res)=>{
  const accionesCount = await prisma.accion.count();
  const skip = Math.floor(Math.random() * accionesCount);
  var auto = await prisma.accion.findMany(
  {
    take:3,
    skip: skip,
    select: {
        Descripcion: true
      }
    }
  )
  res.json(auto)
}
)






app.get('/getLogros', async(req, res)=>{
  const auto = await prisma.trofeo.findMany(
    {
      select: {
        Nombre: true,
        Descripcion: true,
        Imagen: {
          select: {
            Ubicacion: true
          }
        }
      }
    }
  )
  res.json(auto)
})





app.get('/getRangosDeExamen/:id_examen', async(req, res)=>{
  const id_examen = req.params.id_examen
  var auto = await prisma.rangoDeExamen.findMany(
  {
    where: {IdExamen: Number(id_examen)},
    select: {
        MinimoValor: true,
        MaximoValor: true,
        Indicador: true,
        Luz: true
      }
    }
  )
  res.json(auto)
}
)


app.get('/getDatosPacientes', async(req, res)=>{
  var auto = await prisma.paciente.findMany(
  {
    select: {
        Edad: true,
        Autorizacion: {
          select: {
            Nombre: true,
            ApellidoPaterno: true,
            APellidoMaterno: true,
          }
        },
        ExamenPaciente: {
            select: {
              Examen: true
          }
        },
        Parroquia: {
            select:{
              Nombre: true,
              Decanato: {
                select:{
                  Nombre: true,
                  Zona: {
                    select:{
                      Nombre: true,
                      Grupo: {
                        select:{
                          Nombre: true
                        }
                      }
                    }
                  }
                }
              }
              
            }
          
        }
      }
    }
  )
  res.json(auto)
}
)

app.get('/getInformePaciente/:id', async(req, res)=>{
  const id = req.params.id
  var auto = await prisma.paciente.findUnique(
  {
    where: {IdPaciente: Number(id)},
    include: {
        Autorizacion: {
          select: {
            Nombre: true,
            ApellidoPaterno: true,
            APellidoMaterno: true,
            Rol: true,
          }
        },
        ExamenPaciente: {
            select: {
              IdExamen: true
          }
        },
        Parroquia: {
            select:{
              Nombre: true,
              Decanato: {
                select:{
                  Nombre: true,
                  Zona: {
                    select:{
                      Nombre: true,
                      Grupo: {
                        select:{
                          Nombre: true
                        }
                      }
                    }
                  }
                }
              }
              
            }
          
        }
      }
    }
  )
  res.json(auto)
}
)

app.get('/getInformesPacientes', async(req, res)=>{

  var auto = await prisma.paciente.findMany(
  {
    
    select: {
        Autorizacion: {
          select: {
            Nombre: true,
            ApellidoPaterno: true,
            APellidoMaterno: true,
            Rol: true,
          }
        },
        ExamenPaciente: {
            select: {
              Examen: {
                select:{
                  Nombre: true,
                },
                /*distinct: ['Nombre']*/
              },
              
              
          },
          
        },
        
        Parroquia: {
            select:{
              Nombre: true,
              Decanato: {
                select:{
                  Nombre: true,
                  Zona: {
                    select:{
                      Nombre: true,
                      Grupo: {
                        select:{
                          Nombre: true
                        }
                      }
                    }
                  }
                }
              }
              
            }
          
        }
      },
      /*distinct: ['Paciente.ExamenPaciente.Examen.Nombre'] Buscar como hacer el distintc a grupos anidadoss*/
    }
  )
  res.json(auto)
}
)


app.get('/getDatosMedicos', async(req, res)=>{
  
  var auto = await prisma.autorizacion.findMany(
  {
    where: {Rol: "Medico"},
    select: {
        Nombre: true,
        ApellidoPaterno: true,
        APellidoMaterno: true,
        Rol: true,
        Medico: {
          select: {
            IdMedico: true,
            Ubicacion: true,
            Paciente:{
              select: {
              IdPaciente: true,
              Edad: true,
              Autorizacion: {
                select: {
                  Nombre: true,
                  ApellidoPaterno: true,
                  APellidoMaterno: true,
                  Rol: true,
                }
              },
              Parroquia: {
                select:{
                  Nombre: true,
                  Decanato: {
                    select:{
                      Nombre: true,
                      Zona: {
                        select:{
                          Nombre: true,
                          Grupo: {
                            select:{
                              Nombre: true
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
             },
            
          }
        },
        

    }
  }
  }
  ) 
      
  res.json(auto)
}
)

app.get('/getDatosMedico/:id', async(req, res)=>{
  const id = req.params.id
  var auto = await prisma.medico.findMany(
  {
    where: {IdMedico: Number(id)},
    select: {
      Ubicacion: true,
      IdMedico: true,
      Autorizacion: {
          select: {
          Nombre: true,
          ApellidoPaterno: true,
          APellidoMaterno: true,
          Rol: true,
          }

        },
      }
    }

  ) 
      
  res.json(auto)
}
)

app.get('/getPacientesDeMedico/:id', async(req, res)=>{
  const id = req.params.id
  var auto = await prisma.paciente.findMany(
  {
    where: {IdMedico: Number(id)},
    select: {
      Edad: true,
      Autorizacion: {
        select: {
          Nombre: true,
          ApellidoPaterno: true,
          APellidoMaterno: true,
        }
      },
      Parroquia: {
          select:{
            Nombre: true,
            Decanato: {
              select:{
                Nombre: true,
                Zona: {
                  select:{
                    Nombre: true,
                    Grupo: {
                      select:{
                        Nombre: true
                      }
                    }
                  }
                }
              }
            }
            
          }
        
      }
    }
  }
  ) 
      
  res.json(auto)
}
)
  



/*Falta hacer el caso de prueba y probarlo en postman*/ 
/* CASO DE PRUEBA
{
    "resultado": 6,
    "fechaDeExamen": "2022-10-02",
    "ubicacion": "Hospital Nuevo Sur",
    "evaluador": "Aplicación Movil"
}
*/


// POST
app.post('/AddResultadoDePaciente/:id_paceinte/:id_examen', async(req, res)=>{
  const id_paceinte = req.params.id_paceinte
  const id_examen = req.params.id_examen

  var { resultado, fechaDeExamen, ubicacion, evaluador } = req.body;

  let date_ob = new Date();
  var auto = await prisma.examenPaciente.create(
  
  {
    data: {
        Resultado: resultado,
        FechaDeExamen: new Date(fechaDeExamen),
        Ubicacion: ubicacion,
        Evaluador: evaluador,
        Register: date_ob,
        Is_active: true,
        IdPaciente: Number(id_paceinte),
        IdExamen: Number(id_examen)
      }
    }
  )
  res.json(auto)
}
)


/* Test Case
{
    "telefono": "8125961982",
    "titulo": "Psicóloga",
    "nombre": "Mariana Agustin",
    "ubicacion": "San Nicolás de Los Garza",
    "idImagen": 16

}
*/
app.post('/AddLineaDeAtencion/', async(req, res)=>{
  const { telefono, titulo, nombre, ubicacion, idImagen } = req.body;

  let date_ob = new Date();
  var auto = await prisma.lineaDeAtencion.create(
  {
    data: {
        Telefono: telefono,
        Titulo: titulo,
        Nombre: nombre,
        Ubicacion: ubicacion,
        Register: date_ob,
        Is_active: true,
        IdImagen: idImagen
      }
    }
  )
  res.json(auto)
}
)


app.get('/getExamenes', async(req, res)=>{
  const examenes = await prisma.examen.findMany(
    {
      
    }
  )
  res.json(examenes)
})
/*
app.get('/getExamen/:id', async(req, res)=>{
  const {id} = req.params
  const examen = await prisma.examen.findUnique(
    
    
    {
      where: {IdExamen: Number(id)},
    }
  )
  res.json(examen)
})

app.get('/getAdministradores', async(req, res)=>{
  const Administradores = await prisma.administrador.findMany(
    {
      
    }
  )
  res.json(Administradores)
})

app.get('/getAdministrador/:id', async(req, res)=>{
  const {id} = req.params
  const Administrador = await prisma.administrador.findUnique(
    
    
    {
      where: {IdAdministrador: Number(id)},
    }
  )
  res.json(Administrador)
})

app.get('/getMedicos', async(req, res)=>{
  const Medicos = await prisma.medico.findMany(
    {
      
    }
  )
  res.json(Medicos)
})

app.get('/getMedico/:id', async(req, res)=>{
  const {id} = req.params
  const Medico = await prisma.medico.findUnique(
    
    
    {
      where: {IdMedico: Number(id)},
    }
  )
  res.json(Medico)
})

app.get('/getPacientes', async(req, res)=>{
  const Pacientes = await prisma.paciente.findMany(
    {
      
    }
  )
  res.json(Pacientes)
})

app.get('/getPaciente/:id', async(req, res)=>{
  const {id} = req.params
  const Paciente = await prisma.paciente.findUnique(
    
    
    {
      where: {IdPaciente: Number(id)},
    }
  )
  res.json(Paciente)
})

app.get('/getParroquias', async(req, res)=>{
  const Parroquia = await prisma.parroquia.findMany(
    {
      
    }
  )
  res.json(Parroquia)
})

app.get('/getParroquia/:id', async(req, res)=>{
  const {id} = req.params
  const Parroquia = await prisma.parroquia.findUnique(
    
    
    {
      where: {IdParroquia: Number(id)},
    }
  )
  res.json(Parroquia)
})

app.get('/getDecanatos', async(req, res)=>{
  const Decanatos = await prisma.decanato.findMany(
    {
      
    }
  )
  res.json(Decanatos)
})

app.get('/getDecanato/:id', async(req, res)=>{
  const {id} = req.params
  const Decanato = await prisma.decanato.findUnique(
    
    
    {
      where: {IdDecanato: Number(id)},
    }
  )
  res.json(Decanato)
})

app.get('/getZonas', async(req, res)=>{
  const Zonas = await prisma.zona.findMany(
    {
      
    }
  )
  res.json(Zonas)
})

app.get('/getZona/:id', async(req, res)=>{
  const {id} = req.params
  const Zona = await prisma.zona.findUnique(
    
    
    {
      where: {IdZona: Number(id)},
    }
  )
  res.json(Zona)
})

app.get('/getGrupos', async(req, res)=>{
  const Grupos = await prisma.grupo.findMany(
    {
      
    }
  )
  res.json(Grupos)
})

app.get('/getGrupo/:id', async(req, res)=>{
  const {id} = req.params
  const Grupo = await prisma.grupo.findUnique(
    
    
    {
      where: {IdGrupo: Number(id)},
    }
  )
  res.json(Grupo)
})

app.get('/getRespuestas', async(req, res)=>{
  const Respuestas = await prisma.respuesta.findMany(
    {
      
    }
  )
  res.json(Respuestas)
})

app.get('/getRespuesta/:id', async(req, res)=>{
  const {id} = req.params
  const Respuesta = await prisma.respuesta.findUnique(
    
    
    {
      where: {IdRespuesta: Number(id)},
    }
  )
  res.json(Respuesta)
})

app.get('/getPreguntaRespuestas', async(req, res)=>{
  const Respuestas = await prisma.respuesta.findMany(
    {
      
    }
  )
  res.json(Respuestas)
})

app.get('/getRespuesta/:id', async(req, res)=>{
  const {id} = req.params
  const Respuesta = await prisma.respuesta.findUnique(
    
    
    {
      where: {IdRespuesta: Number(id)},
    }
  )
  res.json(Respuesta)
})
*/