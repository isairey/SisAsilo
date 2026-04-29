import {React, useState} from 'react';
import Logo from '../assets/Logo.png';
import './landingPage.css';
import Swal from 'sweetalert2'
import withReactContent from 'sweetalert2-react-content'

const LandingPage = () => {
    const [Username, setUsername] = useState('');
    const [Password, setPassword] = useState('');
    const MySwal = withReactContent(Swal);
    const [isUser, setIsUser] = useState(false);

    const GetUser = (usr,pwd) => {
        // let str = `http://localhost:3000/getAccesoMedico/${encodeURIComponent(usr)}/${encodeURIComponent(pwd)}`;
        // console.log("HERE: ",str);
        // fetch(`http://10.14.255.61:3000/getInformesPacientes`)
        // .then(response =>response.json())
        // .then(data => {
        //     console.log("HEREijiu88i: ", data)
        // })
        // fetch(`http://localhost:3000/getAccesoMedico/correo2@hotmail.com/contraseña2`)
        // .then(response =>response.json())
        //     .then(data => {
        //         console.log("HEREijiu88i: ", data)
        //         if(data == []){
        //             setIsUser(false);
        //         }else{
        //             setIsUser(true);
        //         }
        //     })
        // http://10.14.255.61:3000/getAccesoMedico/:correo/:contrasenia
        // console.log(usr," ",pwd);

        if(usr == "correo4@hotmail.com" && pwd == "contraseña4"){
            setIsUser(true);
            login(usr,pwd);
            // isUser = true;
        }
        else{
            setIsUser(false);
            login(usr,pwd);
        }
        // fetch(`http://10.14.255.61:3000/getAccesoMedico/${encodeURIComponent(usr)}/${encodeURIComponent(pwd)}`)
        // .then(response =>response.json())
        // .then(data => {
        //     // console.log(data[0].Is_active);
        //     let result = data[0].Is_active;
        //     // console.log(!result);
        //     if(!result){
        //         setIsUser(false);
        //         // isUser = false;
        //     }else{
        //         setIsUser(true);
        //         login(usr,pwd);
        //         // isUser = true
        //     }
        // })
    }
    const loginH = (usr,pwd) =>{
        GetUser(usr,pwd);
    }

    const login = (usr,pwd) =>{
        // e.preventDefault();
        // console.log('was pressed',usr,' ',pwd);
        // console.log('I entered');
        // fetch('http://10.14.255.61:3000/getAccesoUsuarios', {method:'GET'})
        //     .then(data => data.json())
        //     .then(json => console.log(JSON.stringify(json)))
        // GetUser(usr,pwd);
        // setIsUser(true);
        console.log('ISUSER: ',isUser);

        if(isUser){
            MySwal.fire({
                title: <strong>Bienvenido</strong>,
                icon: 'success',
                showConfirmButton:true,
                confirmButtonText: '<a href="/dashboardTable">Continuar</a>',
                // confirmButtonText: 'Continuar',
                allowOutsideClick:false,
                confirmButtonColor:'lime',
                customClass:{
                    confirmButton:'order-2'
                }, 
              })
        }else{
            // console.log('incorrecto',usr,' ',pwd);
            // <div>INCORRECTO</div>
            MySwal.fire({
                title: <strong>Usuario o Contrasena Incorrecta</strong>,
                icon: 'error',
                confirmButtonText: 'Regresar',
                customClass:{
                    confirmButton:'order-2'
                }
              })
        }
    }

    const handleChange = event => {
        setUsername(event.target.value);
        // console.log('value is:', event.target.value);
      };
      
    const handleChange2 = event => {
        setPassword(event.target.value);
        // console.log('value is:', event.target.value);
    };
    return <div class="LD" style={{ display: 'flex', height: '100vh'}}>
        <div class="col-6 left">
            <p class="specialFont">Bienvenido</p>
            <h1 class="specialFont">Tamizaje</h1>
            <img src={Logo} class="imgLogo"></img>
        </div>
        <div class="col-6 right">
            <div class="rightContainer">
                <h1 class="specialFont">Tamizaje</h1>
                <input type="Username" id="Username" name="Username" onChange={handleChange} class="form-control userInput" placeholder='Email o nombre de usuario'></input>
                <input type="Password" id="Password" onChange={handleChange2} class="form-control userInput" placeholder='Contrasena'></input>
                <a href="/olvidasteContra">Olvidaste tu Contrasena?</a>
                <p> </p>
                <button class="iniciarSesion specialFont" onClick ={()=>{loginH(Username,Password)}}>Iniciar Sesion</button>
            </div>
        </div>
    </div>
}

export default LandingPage; 