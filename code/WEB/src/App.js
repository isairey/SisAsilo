import './App.css';
import { BrowserRouter, BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from './sidebar/sidebar';
import LandingPage from './landingPage/landingPage';
import OlvidasteContra from './landingPage/olvidasteContra/olvidasteContra';
import OlvidasteContraVeri from './landingPage/olvidasteContraVerificar/olvidasteContraVeri';
import NuevaContra from './landingPage/nuevaContra/nuevaContra';
import Home from './Dashboard/home';
import Home2 from './Dashboard/home2';
// import TABLETEST from './TABLETEST';
import "./assets/Recoleta-Black.ttf"

function App() {
  return (
    <BrowserRouter>
      <div className='App'>
        <Routes>
          <Route path='/' exact element={<LandingPage/>}></Route>
          <Route path='/nuevaContra' element={<NuevaContra/>}></Route>
          <Route path='/olvidasteContra' element={<OlvidasteContra/>}></Route>
          <Route path='/olvidasteContraVeri' element={<OlvidasteContraVeri/>}></Route>
          <Route path='/dashboardTable' element={<Home/>}></Route>
          <Route path='/dashboardProfile' element={<Home2/>}></Route>
          {/* <Route path='/TABLETEST' element={<TABLETEST/>}></Route> */}
        </Routes>
        {/* <Home></Home> */}
      </div>
      {/* <LandingPage></LandingPage> */}
      {/* <Sidebar></Sidebar> */}
      {/* <OlvidasteContra></OlvidasteContra> */}
      {/* <OlvidasteContraVeri></OlvidasteContraVeri> */}
      {/* <NuevaContra></NuevaContra> */}
    </BrowserRouter>
  );
}

export default App;
