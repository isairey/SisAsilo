import {React} from 'react';
import Sidebar from '../sidebar/sidebar';
import Filter from './filter/filter';
import './home2.css';
import UserDetail from './userDetail/userDetail';
import UserTable from './userTable/userTable';

const Home2 = () => {
    return <div class="rowC2">
        <Sidebar></Sidebar> 
        {/* FILTER   PLUS USER TABLE WHEN SEARCHING FOR USER */}
        {/* <Filter></Filter> */}
        {/* <div class="userRow">
            <UserTable></UserTable>
        </div> */}
        <div class="detailRow2">
            <UserDetail></UserDetail>
        </div>
    </div>
}

export default Home2; 