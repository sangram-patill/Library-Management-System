<%-- 
    Document   : staff
    Created on : 10 Apr, 2023, 11:33:13 PM
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
        <title>YCM Admin - Staff Registration</title> 
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
        width: 1220px;
        height: 100%;     /*Change Div height here*/
        background: white;
        margin: 20px 20px;
        display: flex;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    </style>
    </head>
    
    <body onload="generatePassword()">
        <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
        <style><%@include file="dashboard.jsp"%></style>
              
       <!--Start Editing from Below Code-->
        
     <div class="container">
            <div class="content">                   
                  <div class="cards">
                        <div class="card">
                            <div class="box">                                
                            <br>
                      <div class="row">
                             <div class="col-sm-6">
                                   <h4 style="margin: 0% 0% 0% 2%">Staff Register</h4>
                             </div>
                             <div class="col-sm-6">
                                   <a href="total_staff.jsp"><button class="stock">Total Staff</button></a>
                             </div>
                     </div>
                    <form name="staff" action="staff" method="post" enctype="multipart/form-data">

                <hr style="background-color: grey;width: 1120px;height:2px;border-width:0;margin-left: 1%;">

                <!--First and Second Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Registration No</label></div>
                    <div class="col-sm-4"><label class="x">Department</label></div>
                    <div class="col-sm-4"><label class="x">Full Name</label></div>
                </div>
                <div class="row">
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("registration_no")!=null)
                            {
                            %>
                                    <input type="text" id="reg_no" onchange="generatePassword()" onkeypress="return isNumber(event)" name="registration_no" class="y" value="<%=request.getParameter("registration_no")%>">
                            <%
                            }
                            else
                            {
                            %>
                                    <input type="text" id="reg_no" onchange="generatePassword()" onkeypress="return isNumber(event)" name="registration_no" class="y" >
                            <%
                            }
                        %>
                        
                   </div>
                   <div class="col-sm-4">
                       <select id="department" name="department" class="y" required>
                        <%
                                if(request.getParameter("department")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("department")%>"><%=request.getParameter("department")%></option>
                                <%
                                }
                                else
                                       {
                                %>
                                <option>Select Department</option>

                                <%
                                }
                        %>
                        <%
                                String d_name;
                                Connection cn = null; Statement st=null;
                                Class.forName("com.mysql.jdbc.Driver");  cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","root","root"); st= cn.createStatement();
                                String sql = "select * from department"; ResultSet rs = st.executeQuery(sql);
                                while(rs.next()){d_name = rs.getString("d_name").toString();
                            %>
                         <option  value="<%=d_name%>"><%=d_name%></option>
                        <%
                               }
                        %>
                        </select>
                    </div>                    
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("staff_name")!=null)
                            {
                            %>
                                <input type="text" id="name" onchange="generatePassword()" name="fullname" onkeypress="return isString(event)" onchange="generatePassword()" class="y" value="<%=request.getParameter("staff_name")%>">
                            <%
                            }
                            else
                                   {
                            %>
                                <input type="text" id="name" onchange="generatePassword()" name="fullname"  onkeypress="return isString(event)" onchange="generatePassword()" class="y">
                            <%
                            }
                        %>
                   </div>
                </div><br><br>
                    <!--Third and Fourth Row-->
                <div class="row">
                   <div class="col-sm-4"><label class="x">Date Of Birth</label></div>
                   <div class="col-sm-4"><label class="x">Mobile No</label></div>
                   <div class="col-sm-4"><label class="x">Email</label></div>
                   
                </div>
                <div class="row">
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("dob")!=null)
                            {
                            %>
                                    <input type="date" name="dob" class="y" value="<%=request.getParameter("dob")%>">
                            <%
                            }
                            else
                                   {
                            %>
                            <input type="date" id="name" name="dob" class="y">

                            <%
                            }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("mobile")!=null)
                            {
                            %>
                            <input type="text" name="mobileno" class="y" maxlength="10" onkeypress="return isNumber(event)" value="<%=request.getParameter("mobile")%>">
                            <%
                            }
                            else
                                   {
                            %>
                            <input type="text" name="mobileno" maxlength="10" onkeypress="return isNumber(event)" class="y">

                            <%
                            }
                        %>
                   </div>
                   <div class="col-sm-4">
                       <%
                            if(request.getParameter("email")!=null)
                            {
                            %>
                            <input type="email" name="email" class="y" value="<%=request.getParameter("email")%>">
                            <%
                            }
                            else
                                   {
                            %>
                            <input type="email" name="email" class="y">
                            <%
                            }
                        %>
                   </div>
                </div><br><br>
                    <!--fifth and Six Row-->
                 <div class="row">
                   <div class="col-sm-4"><label class="x">Address</label></div>
                   <div class="col-sm-4"><label class="x">City</label></div>
                   <div class="col-sm-4"><label class="x">State</label></div>
                    
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("address")!=null)
                            {
                            %>
                            <input type="text" name="address" class="y" value="<%=request.getParameter("address")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="address" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <%
                            if(request.getParameter("city")!=null)
                            {
                            %>
                            <input type="text" name="city" class="y" value="<%=request.getParameter("city")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="city" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                        <select name="state" class="y" id="inputState">
                        <%
                                if(request.getParameter("state")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("state")%>"><%=request.getParameter("state")%></option>
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
                </div><br><br>
                    <!--Seven and Eight Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">District</label></div>
                    <div class="col-sm-4"><label class="x">Taluka</label></div>
                    <div class="col-sm-4"><label class="x">Gender</label></div>
                <!--Hidden field for staff role-->
                    <div><input type="hidden" name="role" value="staff"></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <select class="y" id="inputDistrict" name="district">
                        <%
                                if(request.getParameter("district")!=null)
                                {
                                %>
                                <option value="<%=request.getParameter("district")%>"><%=request.getParameter("district")%></option>
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
                            if(request.getParameter("taluka")!=null)
                            {
                            %>
                            <input type="text" name="taluka" class="y" onkeypress="return isString(event)" value="<%=request.getParameter("taluka")%>">
                            <%
                            }
                            else
                            {
                            %>
                            <input type="text" name="taluka" onkeypress="return isString(event)" class="y">
                            <%
                            }
                        %>
                    </div>
                    <div class="col-sm-4">
                         <input style="margin-left: 50px;" type="radio" value="Male" name="gender"><label for="Male">Male</label>
                         <input style="margin-left: 20px;" type="radio" value="Female" name="gender"><label for="Female">Female</label>
                         <input style="margin-left: 20px;" type="radio" value="Other" name="gender"><label for="Other">Other</label>
                    </div>     
                    
                </div><br><br>
                <!--Nine and Ten Row-->
                <div class="row">
                    <div class="col-sm-4"><label class="x">Upload Photo</label></div>
                    <div class="col-sm-4"><label class="x">Upload Signature</label></div>
                    <div class="col-sm-4"><label class="x">Password</label></div>
                </div>
                <div class="row">
                    <div class="col-sm-4"><input type="file" name="image" style="margin-left: 50px;"></div>
                    <div class="col-sm-4"><input type="file" name="sign" style="margin-left: 50px;"></div>
                    <div class="col-sm-4"><input type="password" disabled id="password" name="password" class="y"></div>
                    <input type="hidden" name="password1" id="password1">
                </div>
                <br><br>

                 <!--Buttons-->
                 
                <div class="row">
                   <div class="col-sm-2"><input type="submit" name="submit" value="Register" class="addbook" style="margin-left: 50px;margin-bottom: 9%;"></div>
                   <div class="col-sm-2"><input type="submit" name="submit" value="Update" class="addbook" style="margin-left: 50px;"></div>
                   <div class="col-sm-3"><input type="submit" name="submit" value="Remove" class="addbook" style="margin-left: 90px;"></div>
                   <div class="col-sm-2"><input type="reset" value="Reset" class="addbook" style="margin-left: 50px;"></div>
                   <div class="col-sm-2"><input type="submit" name="submit" value="Print ID" class="addbook" style="margin-left: 50px;"></div>
                </div>
                 
                    </form>
                            </div>                           
                        </div>                     
                  </div>
            </div>
        </div>
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
                       
                function generatePassword() {
                      var id = document.getElementById("reg_no").value; 
                      var name = document.getElementById("name").value; 
                      
                      var result = name.toLowerCase();
                      var password =  result.substring(0, 4) + id ;

                      document.getElementById("password").value = password;
                      document.getElementById("password1").value = password;
                      
                      
                    var passwordTextbox = document.getElementById("password");
                     passwordTextbox.value = password;
                      
                      var showPasswordIcon = document.createElement("i");
                        showPasswordIcon.className = "fa fa-eye";
                        showPasswordIcon.onclick = function() {
                          if (passwordTextbox.type === "password") {
                            passwordTextbox.type = "text";
                            showPasswordIcon.className = "fa fa-eye-slash";
                          } else {
                            passwordTextbox.type = "password";
                            showPasswordIcon.className = "fa fa-eye";
                          }
                        };

                    passwordTextbox.insertAdjacentElement("afterend", showPasswordIcon);
                      
               } 
              </script>
    </body>
</html>
