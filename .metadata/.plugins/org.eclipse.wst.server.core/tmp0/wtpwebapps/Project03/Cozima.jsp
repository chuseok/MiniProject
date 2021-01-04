<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500&family=Karla&family=Oswald&family=Roboto:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/Cozima.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>Cozima Home</title>
</head>
<body>

<!-- Header -->
	<jsp:include page="Header.jsp"/>

<!-- Hello -->
  <div class="p-banner" id="section_Hello">
    <h2 class="banner-text">Cada refeição é um mistério <br> por saborear</h2>
    <div class="text-underline"></div>
  </div>

  <div class="container_intro">
    <section class="section_intro">
        <div class="contents-img" ><img src="images/chefs.jpg" width="350px"></div>
        <div class="contents-text">
            <h4>“Imagination is more important than knowledge.” <br>
                – Albert Einstein –</h4>
            <p>Borne by the water surrounding South America to the sweeping waves 
            of the Mediterranean sea hitting the shores of the Maltese Islands,<br> 
            Susurrus presents an exciting Mediterranean cuisine influenced by the diversity of South American food,<br>
            bonded with fresh local ingredients and avant-garde techniques bestowing a novel dining escapade.</p>
        </div>
    </section>
  </div>


<!-- Menu-->
  <div class="p-banner" id="section_Menu">
    <h2 class="banner-text">Menu</h2>
    <div class="text-underline"></div>
  </div>

  <div class="eat-section">
    <input id="main_menu" type="radio" name="sub_nav" checked="checked">
    <input id="side_menu" type="radio" name="sub_nav">
    <input id="drink" type="radio" name="sub_nav">
    <div class="eat-menu">
        <div >
            <label class="eat-menu-label" for="main_menu">Main menu</label>
            <label class="eat-menu-label" for="side_menu">Side menu</label>
            <label class="eat-menu-label" for="drink">Drink</label>
        </div>
    </div>
    <div class="eat-submenu">    
        <section>
            <div class="sub_title">
                <p>Mari</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>salmon trufado</p>
                <p>pork,liquorice</p>
                <p>bacon crispy gyozas</p>
            </div>
            <div class="menu-price">
                <p>KRW 18,500</p>
                <p>KRW 18,500</p>
                <p>KRW 19,000</p>
            </div>
        </section>
        <section>
            <div class="sub_title">
                <p>beef</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>taco</p>
                <p>pisconito </p>
                <p>lacal bass</p>
            </div>
            <div class="menu-price">
                <p>KRW 26,500</p>
                <p>KRW 38,500</p>
                <p>KRW 58,500</p>
            </div>
        </section>
        <section>
            <div class="sub_title">
                <p>Rice</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>boneless imperial duck</p>
                <p>pork on grill</p>
                <p>boneless premium</p>
            </div>
            <div class="menu-price">
                <p>KRW 18,500</p>
                <p>KRW 38,000</p>
                <p>KRW 38,500</p>
            </div>
        </section>
        <section>
            <div class="sub_title">
                <p>Noodle</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
              <p>asian noodle</p>
              <p>noodle fry</p>
            </div>
            <div class="menu-price">
              <p>KRW 8,500</p>
              <p>KRW 8,500</p>
            </div>
        </section>
    </div>
    <div class="eat-submenu">
        <section>
            <div class="sub_title">
              <p>Side</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>seabass</p>
                <p>peking duck</p>
                <p>blue tiger prawns tempura</p>
            </div>
            <div class="menu-price">
              <p>KRW 20,000</p>
              <p>KRW 20,000</p>
              <p>KRW 40,000</p>              
            </div>
        </section>
        <section>
            <div class="sub_title">
              <p>Other</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>rabbit taco</p>
                <p>sea meagre</p>
                <p>sea meagre vegan</p>
            </div>
            <div class="menu-price">
              <p>KRW 8,500</p>
              <p>KRW 13,000</p>
              <p>KRW 20,500</p>              
            </div>
        </section>
    </div>
    <div class="eat-submenu">
        <section>
            <div class="sub_title">
              <p>Beverage</p>
                <div class="my-line"></div>
            </div>
            <div class="menu-name">
                <p>grambeira</p>
                <p>planalto</p>
                <p>pomares</p>
            </div>
            <div class="menu-price">
              <p>KRW 18,500</p>
              <p>KRW 23,000</p>
              <p>KRW 30,000</p>              
            </div>
        </section>
    </div>
</div>

<!-- Gallery -->

<jsp:include page="gallery.jsp"></jsp:include>


<!-- Contact -->
  <div class="p-banner" id="section_Contact">
    <h2 class="banner-text">Contact</h2>
    <div class="text-underline"></div>
  </div>
  <div class="container_Contact">
    <section class="section_Contact">
      <div id="location_text">
          <div class="text_block">
              <ul>
                  <li><h4>ADDRESS</h4></li>
                  <li><p>서울시 강남구 <br> 논현로 76길 27 2층</p></li>
              </ul>
          </div>
          <div class="text_block">
              <ul>
                <li><h4>FREE PARKING</h4></li>
              </ul>
          </div>
          <div class="text_block">
              <ul>
                <li><h4>OPENING HOURS</h4></li>
                <li><p>Mon To Sun <br> 10:00 to 22:00</p></li>
              </ul>
          </div>
          <div class="text_block">
              <ul>
                <li><h4>CONTACT NUMBER</h4></li>
                <li><P>02-515-9657</P></li>
              </ul>
          </div>
      </div>
      <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.2426812030712!2d126.88296601564527!3d37.47859917981453!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.
        1!3m3!1m2!1s0x357b61e1915f6d57%3A0x9bafbfdb92b0d448!2z7Iqk7L-o7ZG465Oc66eI66as7Jik7JWE7Jq466Cb7KCQ!5e0!3m2!1sko!2skr!4v1591777738572!5m2!1sko!2skr" 
        width="650" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
      </div>
    </section>
  </div>

  <div class="p-banner" id="section_Reservation">
    <h2 class="banner-text">Reservation</h2>
    <div class="text-underline"></div>
  </div>
  
<!-- Reservation -->
  <jsp:include page="resFrm.jsp"/>
  
<!-- Footer -->  
	<jsp:include page="Footer.jsp"/>


<script type="text/javascript" src="js/test.js"></script>

</body>
</html>