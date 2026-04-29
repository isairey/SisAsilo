import {React} from 'react';
import { NavLink } from 'react-router-dom';
import Logo from '../../assets/Logo.png';
import './olvidasteContra.css';

const OlvidasteContra = () => {
    return <div class="LD" style={{ display: 'flex', height: '100vh'}}>
        <div class="col-6 left">
            <p>Bienvenido</p>
            <h1>Abuelitos Abp</h1>
            <img src={Logo} class="imgLogo"></img>
        </div>
        <div class="col-6 right">
            <div class="rightContainer2">
                <h1>Abuelitos Abm</h1>
                <input type="Username" class="form-control userInput" placeholder='Email o nombre de usuario'></input>
                <NavLink exact to="/olvidasteContraVeri">
                    <button class="recuperarContra" onClick={() => this.ne}>Recuperar Contrasena</button>
                </NavLink>
            </div>
        </div>
    </div>
}

export default OlvidasteContra; 