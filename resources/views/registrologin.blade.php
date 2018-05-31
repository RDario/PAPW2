@include('header')
<div class="account">
        <div class="container">
            <div class="account-bottom">
                <div class="col-md-6 account-left">
                    <form action="registro_success_page.php" method="POST">
                        <div class="account-top heading">
                            <h3>¡Registrate!</h3>
                        </div>
                        <div class="address">
                            <span>Nombre</span>
                            <input type="text" name="txtNombre" required="">
                        </div>
                        <div class="address">
                            <span>Apellidos</span>
                            <input type="text" name="txtApellidos" required="">
                        </div>
                        <div class="address">
                            <span>Correo electronico</span>
                            <input type="text" name="txtEmail" required="">
                        </div>
                        <div class="address">
                            <span>Contraseña</span>
                            <input type="password" name="txtPassword" required="">
                        </div>
                        <div class="address">
                            <span>Fecha de nacimiento</span>
                            <select name="txtNacDia" placeholder="" required="">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                            <select name="txtNacMes" placeholder="Mayo" required="">
                                <option>Enero</option>
                                <option>Febrero</option>
                                <option>Marzo</option>
                                <option>Abril</option>
                                <option>Mayo</option>
                                <option>Junio</option>
                                <option>Julio</option>
                                <option>Agosto</option>
                                <option>Septiembre</option>
                                <option>Octubre</option>
                                <option>Noviembre</option>
                                <option>Diciembre</option>
                            </select>
                            <select name="txtNacAnio" placeholder="México" required="">
                                <option>2016</option>
                                <option>2015</option>
                                <option>2014</option>
                                <option>2013</option>
                                <option>2012</option>
                                <option>2011</option>
                                <option>2010</option>
                                <option>2009</option>
                                <option>2008</option>
                                <option>2007</option>
                                <option>2006</option>
                                <option>2005</option>
                                <option>2004</option>
                                <option>2003</option>
                                <option>2002</option>
                                <option>2001</option>
                                <option>2000</option>
                                <option>1999</option>
                                <option>1998</option>
                                <option>1997</option>
                                <option>1996</option>
                                <option>1995</option>
                                <option>1994</option>
                                <option>1993</option>
                                <option>1992</option>
                                <option>1991</option>
                                <option>1990</option>
                                <option>1989</option>
                                <option>1988</option>
                                <option>1987</option>
                                <option>1986</option>
                                <option>1985</option>
                                <option>1984</option>
                                <option>1983</option>
                                <option>1982</option>
                                <option>1981</option>
                                <option>1980</option>
                                <option>1979</option>
                                <option>1978</option>
                                <option>1977</option>
                                <option>1976</option>
                                <option>1975</option>
                                <option>1974</option>
                                <option>1973</option>
                                <option>1972</option>
                                <option>1971</option>
                                <option>1970</option>
                                <option>1969</option>
                                <option>1968</option>
                                <option>1967</option>
                                <option>1966</option>
                                <option>1965</option>
                                <option>1964</option>
                                <option>1963</option>
                                <option>1962</option>
                                <option>1961</option>
                                <option>1960</option>
                                <option>1959</option>
                                <option>1958</option>
                                <option>1957</option>
                                <option>1956</option>
                                <option>1955</option>
                                <option>1954</option>
                                <option>1953</option>
                                <option>1952</option>
                                <option>1951</option>
                                <option>1950</option>
                                <option>1949</option>
                                <option>1948</option>
                                <option>1947</option>
                                <option>1946</option>
                                <option>1945</option>
                                <option>1944</option>
                                <option>1943</option>
                                <option>1942</option>
                                <option>1941</option>
                                <option>1940</option>
                                <option>1939</option>
                                <option>1938</option>
                                <option>1937</option>
                                <option>1936</option>
                                <option>1935</option>
                                <option>1934</option>
                                <option>1933</option>
                                <option>1932</option>
                                <option>1931</option>
                                <option>1930</option>
                                <option>1929</option>
                                <option>1928</option>
                                <option>1927</option>
                                <option>1926</option>
                                <option>1925</option>
                                <option>1924</option>
                                <option>1923</option>
                                <option>1922</option>
                                <option>1921</option>
                                <option>1920</option>
                            </select>
                        </div>
                        <div class="address">
                            <span>Telefono (opcional)</span>
                            <input type="text" name="txtTelefono" maxlength="10">
                        </div>
                        <div class="address">
                            <span>Tipo usuario</span>
                            <select name="txtTipoUsuario" placeholder="" required="" disabled="">
                                <option>Normal</option>
                                <option>Reportero</option>
                                <option>Administrador</option>
                            </select>
                        </div>
                        <div class="address new">
                            <input type="submit" value="Registrar">
                        </div>
                    </form>
                </div>
                <div class="col-md-6 account-left second">
                    <form action="{{ route('loginsuccess',1) }}" method="POST">
                        {{ csrf_field() }}
                        <div class="account-top heading">
                            <h3>Login</h3>
                        </div>
                        <div class="address">
                            <span>Correo electronico</span>
                            <input type="text" name="txtEmail" required="" placeholder="example@hotmail.com">
                        </div>
                        <div class="address">
                            <span>Contraseña</span>
                            <input type="password" name="txtPassword" required="" placeholder="*******">
                        </div>
                        <div class="address">
                            <input type="submit" value="Entrar">
                        </div>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
   @include('footer')