<%-- 
    Document   : binder_registration
    Created on : 1 Mar, 2023, 1:52:37 PM
    Author     : sangr
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YCM Admin - Add Binder</title> 
        <style><%@include file="css/jspdashboard.css"%></style>
        <link rel="icon" type="image/x-icon" href="image/fevicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Lexend+Mega:wght@300&display=swap" rel="stylesheet">
        <script type="text/javascript" src="css/validation.js"></script>
        <style>
        .container .content .cards .card{
    width: 1200px;
    height: 100%;     /*Change Div height here*/
    background: white;
    margin: 20px 20px;
    display: flex;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
    </style>
    </head>
    <body>
         <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
        <style><%@include file="dashboard.jsp"%></style> 
        
         <!---Start Editing from Below Code--->
         
         <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                                <br>
                                <h4 style="margin: 0% 0% 0% 2%">Binder Registration</h4>
                                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                               <br>
                               <form name="binder_registration" action="binder_registration1" method="post">
                                <!--First and Second Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Binder ID</label></div>
                   <div class="col-sm-4"><label class="x">Name</label></div>
                   <div class="col-sm-4"><label class="x">Company Name</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            int bi_id = 1;
                            Connection cn = null; Statement st=null;
                            Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                            String sql = "select * from binder"; ResultSet rs = st.executeQuery(sql);
                            while(rs.next()) {  bi_id = Integer.parseInt( rs.getString("bi_id").toString()) + 1 ; }
                         %>
                        <%
                            if(request.getParameter("bi_id")!=null)
                            {
                            %>
                                    <input type="text" name="binder_id" class="y" onkeypress="return isNumber(event)" value="<%=request.getParameter("bi_id")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_id" required onkeypress="return isNumber(event)" class="y" value="<%=bi_id%>">
                            <%
                            }
                        %>                    
                    </div>
                   <div class="col-sm-4">
                        <%
                            if(request.getParameter("bi_name")!=null)
                            {
                            %>
                                    <input type="text" name="binder_name" onkeypress="return isString(event)" class="y" value="<%=request.getParameter("bi_name")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_name" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("bi_company")!=null)
                            {
                            %>
                                    <input type="text" name="binder_company_name" onkeypress="return isString(event)" class="y" value="<%=request.getParameter("bi_company")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_company_name" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                   </div> 
                </div><br><br>
                
                                 <!--Third and Fourth Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Phone</label></div>
                   <div class="col-sm-4"><label class="x">E-mail</label></div>
                   <div class="col-sm-4"><label class="x">Address</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("bi_phone")!=null)
                            {
                            %>
                                    <input type="text" name="binder_phone" maxlength="10" onkeypress="return isNumber(event)" class="y" value="<%=request.getParameter("bi_phone")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_phone" maxlength="10" onkeypress="return isNumber(event)" class="y">
                            <%
                            }
                        %>
                    </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("bi_email")!=null)
                            {
                            %>
                                    <input type="email" name="binder_email" class="y" value="<%=request.getParameter("bi_email")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="email" name="binder_email" class="y">
                            <%
                            }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("bi_address")!=null)
                            {
                            %>
                                    <input type="text" name="binder_address" class="y" value="<%=request.getParameter("bi_address")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_address" class="y">
                            <%
                            }
                        %>
                   </div>
                </div><br><br>
                                 <!--fifth and Six Row-->
                 <div class="row">
                     <div class="col-sm-4"><label class="x">State</label></div>
                   <div class="col-sm-4"><label class="x">District</label></div>
                   <div class="col-sm-4"><label class="x">Taluka</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <select name="binder_state" class="y" id="inputState">
                        <%
                                if(request.getParameter("bi_state")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("bi_state")%>"><%=request.getParameter("bi_state")%></option>
                                <%
                                }
                                else
                                       {
                                %>
                                <option value="SelectState">Select State</option>

                                <%
                                }
                        %>      
                              
                            <option value="Andra Pradesh">Andra Pradesh</option>
                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chhattisgarh">Chhattisgarh</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujarat">Gujarat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Madya Pradesh">Madya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="Orissa">Orissa</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttaranchal">Uttaranchal</option>
                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                            <option value="West Bengal">West Bengal</option>
                            <option disabled style="background-color:#aaa; color:#fff">UNION Territories</option>
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                            <option value="Daman and Diu">Daman and Diu</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Lakshadeep">Lakshadeep</option>                             
                            <option value="Pondicherry">Pondicherry</option>                        
                               }
                        %>
                        </select>
                   </div>
                    <div class="col-sm-4">
                       <select class="y" id="inputDistrict" name="binder_district">
                        <%
                                if(request.getParameter("bi_district")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("bi_district")%>"><%=request.getParameter("bi_district")%></option>
                                <%
                                }
                                else
                                       {
                                %>
                                <option value="">Select District</option>

                                <%
                                }
                        %>      
                                                       
                               }
                        %>
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("bi_taluka")!=null)
                            {
                            %>
                                    <input type="text" name="binder_taluka" onkeypress="return isString(event)" class="y" value="<%=request.getParameter("bi_taluka")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                    <input type="text" name="binder_taluka" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                    </div>
                </div><br><br><br>
                
                <!--Buttons-->
               <div class="row">
                   <div class="col-sm-3"><input type="submit" name="submit" value="Add Binder" class="addbook" style="margin-left: 50px; width: 160px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Update Binder" class="addbook" style="margin-left: 50px; width: 160px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Delete Binder" class="addbook" style="margin-left: 50px; width: 160px;"></div>
                   <div class="col-sm-3"><input type="reset" value="Reset Form" class="addbook" style="margin-left: 50px; width: 160px;"></div>
                </div><br>     
                               </form>
                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%">
                <h4 style="margin: 0% 0% 0% 2%">All Binders</h4>
                <br><br>
                
                <div class="row">
                     <input id="search" type="text" placeholder="Search Binder..." style="margin-left: 2.5%;">
                </div>

                <br>
                <table style="margin-bottom: 3%;">
		<thead>
			<tr>
                                <th class="textcenter">Binder ID</th>
				<th class="textcenter">Name</th>
				<th class="textcenter">Company Name</th>
                                <th class="textcenter">Phone</th>
				<th class="textcenter">Email</th>
				<th class="textcenter">Address</th>
                                <th class="textcenter">Taluka</th>
			        <th class="textcenter">Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
            try {
                 Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                 sql = "select * from binder"; rs = st.executeQuery(sql);

                while (rs.next()) {
                    %>
                <form action="binder_registration.jsp" method="post">
                        <tr>
                            <td><%=rs.getInt("bi_id")%></td>
                    <input type="hidden" name="bi_id" value="<%=rs.getString("bi_id")%>">
                            <td><%=rs.getString("bi_name")%></td>
                    <input type="hidden" name="bi_name" value="<%=rs.getString("bi_name")%>">
                            <td><%=rs.getString("bi_company")%></td>
                    <input type="hidden" name="bi_company" value="<%=rs.getString("bi_company")%>">
                            <td><%=rs.getString("bi_phone")%></td>
                    <input type="hidden" name="bi_phone" value="<%=rs.getString("bi_phone")%>">
                            <td><%=rs.getString("bi_email")%></td>
                    <input type="hidden" name="bi_email" value="<%=rs.getString("bi_email")%>">
                            <td><%=rs.getString("bi_address")%></td>
                    <input type="hidden" name="bi_address" value="<%=rs.getString("bi_address")%>">
                            <td><%=rs.getString("bi_taluka")%></td>
                    <input type="hidden" name="bi_taluka" value="<%=rs.getString("bi_taluka")%>">
                    <input type="hidden" name="bi_district" value="<%=rs.getString("bi_district")%>">
                    <input type="hidden" name="bi_state" value="<%=rs.getString("bi_state")%>">
                            <td><input type="submit" value="Action" class="stock"></td>
                        </tr>
                </form>
                    <%
                }
            } 
            catch (Exception ex) 
            {
                out.println(ex.toString());
            } 
        %>
		</tbody>
	</table>
                <!--Data not found-->
                <div id="message" style="display: none; text-align: center; margin-bottom: 2%; font-size: 16px;">No match found &#128546;</div>
                        </div>                     
                  </div>
            </div>
        </div>
     </div>
         </form>
                   
                   <script type="text/javascript">
var AndraPradesh = ["Anantapur","Chittoor","East Godavari","Guntur","Kadapa","Krishna","Kurnool","Prakasam","Nellore","Srikakulam","Visakhapatnam","Vizianagaram","West Godavari"];
var ArunachalPradesh = ["Anjaw","Changlang","Dibang Valley","East Kameng","East Siang","Kra Daadi","Kurung Kumey","Lohit","Longding","Lower Dibang Valley","Lower Subansiri","Namsai","Papum Pare","Siang","Tawang","Tirap","Upper Siang","Upper Subansiri","West Kameng","West Siang","Itanagar"];
var Assam = ["Baksa","Barpeta","Biswanath","Bongaigaon","Cachar","Charaideo","Chirang","Darrang","Dhemaji","Dhubri","Dibrugarh","Goalpara","Golaghat","Hailakandi","Hojai","Jorhat","Kamrup Metropolitan","Kamrup (Rural)","Karbi Anglong","Karimganj","Kokrajhar","Lakhimpur","Majuli","Morigaon","Nagaon","Nalbari","Dima Hasao","Sivasagar","Sonitpur","South Salmara Mankachar","Tinsukia","Udalguri","West Karbi Anglong"];
var Bihar = ["Araria","Arwal","Aurangabad","Banka","Begusarai","Bhagalpur","Bhojpur","Buxar","Darbhanga","East Champaran","Gaya","Gopalganj","Jamui","Jehanabad","Kaimur","Katihar","Khagaria","Kishanganj","Lakhisarai","Madhepura","Madhubani","Munger","Muzaffarpur","Nalanda","Nawada","Patna","Purnia","Rohtas","Saharsa","Samastipur","Saran","Sheikhpura","Sheohar","Sitamarhi","Siwan","Supaul","Vaishali","West Champaran"];
var Chhattisgarh = ["Balod","Baloda Bazar","Balrampur","Bastar","Bemetara","Bijapur","Bilaspur","Dantewada","Dhamtari","Durg","Gariaband","Janjgir Champa","Jashpur","Kabirdham","Kanker","Kondagaon","Korba","Koriya","Mahasamund","Mungeli","Narayanpur","Raigarh","Raipur","Rajnandgaon","Sukma","Surajpur","Surguja"];
var Goa = ["North Goa","South Goa"];
var Gujarat = ["Ahmedabad","Amreli","Anand","Aravalli","Banaskantha","Bharuch","Bhavnagar","Botad","Chhota Udaipur","Dahod","Dang","Devbhoomi Dwarka","Gandhinagar","Gir Somnath","Jamnagar","Junagadh","Kheda","Kutch","Mahisagar","Mehsana","Morbi","Narmada","Navsari","Panchmahal","Patan","Porbandar","Rajkot","Sabarkantha","Surat","Surendranagar","Tapi","Vadodara","Valsad"];
var Haryana = ["Ambala","Bhiwani","Charkhi Dadri","Faridabad","Fatehabad","Gurugram","Hisar","Jhajjar","Jind","Kaithal","Karnal","Kurukshetra","Mahendragarh","Mewat","Palwal","Panchkula","Panipat","Rewari","Rohtak","Sirsa","Sonipat","Yamunanagar"];
var HimachalPradesh = ["Bilaspur","Chamba","Hamirpur","Kangra","Kinnaur","Kullu","Lahaul Spiti","Mandi","Shimla","Sirmaur","Solan","Una"];
var JammuKashmir = ["Anantnag","Bandipora","Baramulla","Budgam","Doda","Ganderbal","Jammu","Kargil","Kathua","Kishtwar","Kulgam","Kupwara","Leh","Poonch","Pulwama","Rajouri","Ramban","Reasi","Samba","Shopian","Srinagar","Udhampur"];
var Jharkhand = ["Bokaro","Chatra","Deoghar","Dhanbad","Dumka","East Singhbhum","Garhwa","Giridih","Godda","Gumla","Hazaribagh","Jamtara","Khunti","Koderma","Latehar","Lohardaga","Pakur","Palamu","Ramgarh","Ranchi","Sahebganj","Seraikela Kharsawan","Simdega","West Singhbhum"];
var Karnataka = ["Bagalkot","Bangalore Rural","Bangalore Urban","Belgaum","Bellary","Bidar","Vijayapura","Chamarajanagar","Chikkaballapur","Chikkamagaluru","Chitradurga","Dakshina Kannada","Davanagere","Dharwad","Gadag","Gulbarga","Hassan","Haveri","Kodagu","Kolar","Koppal","Mandya","Mysore","Raichur","Ramanagara","Shimoga","Tumkur","Udupi","Uttara Kannada","Yadgir"];
var Kerala = ["Alappuzha","Ernakulam","Idukki","Kannur","Kasaragod","Kollam","Kottayam","Kozhikode","Malappuram","Palakkad","Pathanamthitta","Thiruvananthapuram","Thrissur","Wayanad"];
var MadhyaPradesh = ["Agar Malwa","Alirajpur","Anuppur","Ashoknagar","Balaghat","Barwani","Betul","Bhind","Bhopal","Burhanpur","Chhatarpur","Chhindwara","Damoh","Datia","Dewas","Dhar","Dindori","Guna","Gwalior","Harda","Hoshangabad","Indore","Jabalpur","Jhabua","Katni","Khandwa","Khargone","Mandla","Mandsaur","Morena","Narsinghpur","Neemuch","Panna","Raisen","Rajgarh","Ratlam","Rewa","Sagar","Satna",
"Sehore","Seoni","Shahdol","Shajapur","Sheopur","Shivpuri","Sidhi","Singrauli","Tikamgarh","Ujjain","Umaria","Vidisha"];
var Maharashtra = ["Ahmednagar","Akola","Amravati","Aurangabad","Beed","Bhandara","Buldhana","Chandrapur","Dhule","Gadchiroli","Gondia","Hingoli","Jalgaon","Jalna","Kolhapur","Latur","Mumbai City","Mumbai Suburban","Nagpur","Nanded","Nandurbar","Nashik","Osmanabad","Palghar","Parbhani","Pune","Raigad","Ratnagiri","Sangli","Satara","Sindhudurg","Solapur","Thane","Wardha","Washim","Yavatmal"];
var Manipur = ["Bishnupur","Chandel","Churachandpur","Imphal East","Imphal West","Jiribam","Kakching","Kamjong","Kangpokpi","Noney","Pherzawl","Senapati","Tamenglong","Tengnoupal","Thoubal","Ukhrul"];
var Meghalaya = ["East Garo Hills","East Jaintia Hills","East Khasi Hills","North Garo Hills","Ri Bhoi","South Garo Hills","South West Garo Hills","South West Khasi Hills","West Garo Hills","West Jaintia Hills","West Khasi Hills"];
var Mizoram = ["Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip","Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip"];
var Nagaland = ["Dimapur","Kiphire","Kohima","Longleng","Mokokchung","Mon","Peren","Phek","Tuensang","Wokha","Zunheboto"];
var Odisha = ["Angul","Balangir","Balasore","Bargarh","Bhadrak","Boudh","Cuttack","Debagarh","Dhenkanal","Gajapati","Ganjam","Jagatsinghpur","Jajpur","Jharsuguda","Kalahandi","Kandhamal","Kendrapara","Kendujhar","Khordha","Koraput","Malkangiri","Mayurbhanj","Nabarangpur","Nayagarh","Nuapada","Puri","Rayagada","Sambalpur","Subarnapur","Sundergarh"];
var Punjab = ["Amritsar","Barnala","Bathinda","Faridkot","Fatehgarh Sahib","Fazilka","Firozpur","Gurdaspur","Hoshiarpur","Jalandhar","Kapurthala","Ludhiana","Mansa","Moga","Mohali","Muktsar","Pathankot","Patiala","Rupnagar","Sangrur","Shaheed Bhagat Singh Nagar","Tarn Taran"];
var Rajasthan = ["Ajmer","Alwar","Banswara","Baran","Barmer","Bharatpur","Bhilwara","Bikaner","Bundi","Chittorgarh","Churu","Dausa","Dholpur","Dungarpur","Ganganagar","Hanumangarh","Jaipur","Jaisalmer","Jalore","Jhalawar","Jhunjhunu","Jodhpur","Karauli","Kota","Nagaur","Pali","Pratapgarh","Rajsamand","Sawai Madhopur","Sikar","Sirohi","Tonk","Udaipur"];
var Sikkim = ["East Sikkim","North Sikkim","South Sikkim","West Sikkim"];
var TamilNadu = ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kanchipuram","Kanyakumari","Karur","Krishnagiri","Madurai","Nagapattinam","Namakkal","Nilgiris","Perambalur","Pudukkottai","Ramanathapuram","Salem","Sivaganga","Thanjavur","Theni","Thoothukudi","Tiruchirappalli","Tirunelveli","Tiruppur","Tiruvallur","Tiruvannamalai","Tiruvarur","Vellore","Viluppuram","Virudhunagar"];
var Telangana = ["Adilabad","Bhadradri Kothagudem","Hyderabad","Jagtial","Jangaon","Jayashankar","Jogulamba","Kamareddy","Karimnagar","Khammam","Komaram Bheem","Mahabubabad","Mahbubnagar","Mancherial","Medak","Medchal","Nagarkurnool","Nalgonda","Nirmal","Nizamabad","Peddapalli","Rajanna Sircilla","Ranga Reddy","Sangareddy","Siddipet","Suryapet","Vikarabad","Wanaparthy","Warangal Rural","Warangal Urban","Yadadri Bhuvanagiri"];
var Tripura = ["Dhalai","Gomati","Khowai","North Tripura","Sepahijala","South Tripura","Unakoti","West Tripura"];
var UttarPradesh = ["Agra","Aligarh","Allahabad","Ambedkar Nagar","Amethi","Amroha","Auraiya","Azamgarh","Baghpat","Bahraich","Ballia","Balrampur","Banda","Barabanki","Bareilly","Basti","Bhadohi","Bijnor","Budaun","Bulandshahr","Chandauli","Chitrakoot","Deoria","Etah","Etawah","Faizabad","Farrukhabad","Fatehpur","Firozabad","Gautam Buddha Nagar","Ghaziabad","Ghazipur","Gonda","Gorakhpur","Hamirpur","Hapur","Hardoi","Hathras","Jalaun","Jaunpur","Jhansi","Kannauj","Kanpur Dehat","Kanpur Nagar","Kasganj","Kaushambi","Kheri","Kushinagar","Lalitpur","Lucknow","Maharajganj","Mahoba","Mainpuri","Mathura","Mau","Meerut","Mirzapur","Moradabad","Muzaffarnagar","Pilibhit","Pratapgarh","Raebareli","Rampur","Saharanpur","Sambhal","Sant Kabir Nagar","Shahjahanpur","Shamli","Shravasti","Siddharthnagar","Sitapur","Sonbhadra","Sultanpur","Unnao","Varanasi"];
var Uttarakhand  = ["Almora","Bageshwar","Chamoli","Champawat","Dehradun","Haridwar","Nainital","Pauri","Pithoragarh","Rudraprayag","Tehri","Udham Singh Nagar","Uttarkashi"];
var WestBengal = ["Alipurduar","Bankura","Birbhum","Cooch Behar","Dakshin Dinajpur","Darjeeling","Hooghly","Howrah","Jalpaiguri","Jhargram","Kalimpong","Kolkata","Malda","Murshidabad","Nadia","North 24 Parganas","Paschim Bardhaman","Paschim Medinipur","Purba Bardhaman","Purba Medinipur","Purulia","South 24 Parganas","Uttar Dinajpur"];
var AndamanNicobar = ["Nicobar","North Middle Andaman","South Andaman"];
var Chandigarh = ["Chandigarh"];
var DadraHaveli = ["Dadra Nagar Haveli"];
var DamanDiu = ["Daman","Diu"];
var Delhi = ["Central Delhi","East Delhi","New Delhi","North Delhi","North East Delhi","North West Delhi","Shahdara","South Delhi","South East Delhi","South West Delhi","West Delhi"];
var Lakshadweep = ["Lakshadweep"];
var Puducherry = ["Karaikal","Mahe","Puducherry","Yanam"];


$("#inputState").change(function(){
  var StateSelected = $(this).val();
  var optionsList;
  var htmlString = "";

  switch (StateSelected) {
    case "Andra Pradesh":
        optionsList = AndraPradesh;
        break;
    case "Arunachal Pradesh":
        optionsList = ArunachalPradesh;
        break;
    case "Assam":
        optionsList = Assam;
        break;
    case "Bihar":
        optionsList = Bihar;
        break;
    case "Chhattisgarh":
        optionsList = Chhattisgarh;
        break;
    case "Goa":
        optionsList = Goa;
        break;
    case  "Gujarat":
        optionsList = Gujarat;
        break;
    case "Haryana":
        optionsList = Haryana;
        break;
    case "Himachal Pradesh":
        optionsList = HimachalPradesh;
        break;
    case "Jammu and Kashmir":
        optionsList = JammuKashmir;
        break;
    case "Jharkhand":
        optionsList = Jharkhand;
        break;
    case  "Karnataka":
        optionsList = Karnataka;
        break;
    case "Kerala":
        optionsList = Kerala;
        break;
    case  "Madya Pradesh":
        optionsList = MadhyaPradesh;
        break;
    case "Maharashtra":
        optionsList = Maharashtra;
        break;
    case  "Manipur":
        optionsList = Manipur;
        break;
    case "Meghalaya":
        optionsList = Meghalaya ;
        break;
    case  "Mizoram":
        optionsList = Mizoram;
        break;
    case "Nagaland":
        optionsList = Nagaland;
        break;
    case  "Orissa":
        optionsList = Orissa;
        break;
    case "Punjab":
        optionsList = Punjab;
        break;
    case  "Rajasthan":
        optionsList = Rajasthan;
        break;
    case "Sikkim":
        optionsList = Sikkim;
        break;
    case  "Tamil Nadu":
        optionsList = TamilNadu;
        break;
    case  "Telangana":
        optionsList = Telangana;
        break;
    case "Tripura":
        optionsList = Tripura ;
        break;
    case  "Uttaranchal":
        optionsList = Uttaranchal;
        break;
    case  "Uttar Pradesh":
        optionsList = UttarPradesh;
        break;
    case "West Bengal":
        optionsList = WestBengal;
        break;
    case  "Andaman and Nicobar Islands":
        optionsList = AndamanNicobar;
        break;
    case "Chandigarh":
        optionsList = Chandigarh;
        break;
    case  "Dadar and Nagar Haveli":
        optionsList = DadraHaveli;
        break;
    case "Daman and Diu":
        optionsList = DamanDiu;
        break;
    case  "Delhi":
        optionsList = Delhi;
        break;
    case "Lakshadeep":
        optionsList = Lakshadeep ;
        break;
    case  "Pondicherry":
        optionsList = Pondicherry;
        break;
}


  for(var i = 0; i < optionsList.length; i++){
    htmlString = htmlString+"<option value='"+ optionsList[i] +"'>"+ optionsList[i] +"</option>";
  }
  $("#inputDistrict").html(htmlString);

});
                       
		var searchInput = document.getElementById("search");
		var tableRows = document.getElementsByTagName("tr");
                var messageDiv = document.getElementById("message");

		searchInput.addEventListener("keyup", function() {
			var searchString = this.value.toLowerCase();
                        var matchFound = false;
			for (var i = 1; i < tableRows.length; i++) {
				var rowData = tableRows[i].textContent.toLowerCase();
				if (rowData.includes(searchString)) {
					tableRows[i].style.display = "";
                                        matchFound = true;
				} else {
					tableRows[i].style.display = "none";
                                        tableRows[i].style.backgroundColor = "";
				}
			}
                        if (matchFound) {
				messageDiv.style.display = "none";
			} else {
				messageDiv.style.display = "";
			}
		});

                   </script>
    </body>
</html>

