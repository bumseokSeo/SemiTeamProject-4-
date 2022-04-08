<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰페이지</title>
<link rel="stylesheet" href="css/review.css"/>
</head>
<body>
<div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" />
  <label for="5-stars" class="star">&#9733;</label>
  <input type="radio" id="4-stars" name="rating" value="4" />
  <label for="4-stars" class="star">&#9733;</label>
  <input type="radio" id="3-stars" name="rating" value="3" />
  <label for="3-stars" class="star">&#9733;</label>
  <input type="radio" id="2-stars" name="rating" value="2" />
  <label for="2-stars" class="star">&#9733;</label>
  <input type="radio" id="1-star" name="rating" value="1" />
  <label for="1-star" class="star">&#9733;</label>
</div>

<article>
  <h4>How it works</h4>
  <p>The stars are labels which each reference a radio button. They are written in the code in reverse order, 5-1.</p>
  <p>By using display:flex and flex-direction:row-reverse on their container they appear in the browser the opposite way around, 1-5.</p>
  <p>We can now use the general sibling selector ~ to style any subsequent elements - the ones that appear before on screen.</p>
  <p><a href="https://codepen.io/chris22smith/pen/pRQGBv">Alternate version with floats for legacy browsers</a></p>
</article>
</body>
</html>