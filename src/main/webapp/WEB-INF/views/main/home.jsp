<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
            

<!--// Banner //-->
        <div class="ritekhela-banner-one">
            
            <div class="ritekhela-banner-one-layer">
                <span class="ritekhela-banner-transparent"></span>
                <img src="/resources/bootstrap/extra-images/example.jpg" alt="">
                <div class="ritekhela-banner-caption">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1><strong class="ritekhela-color">상대 팀</strong> 이 필요하세요?</h1>
                                <div class="clearfix"></div>
                                <p>매칭게시판 내의 을매칭을 이용 하시면 상대 팀을 구할 수 있습니다! 혹시 인원이 소수가 부족 하다면 용병모집을 이용하여 보세요!</p>
                                <div class="clearfix"></div>
                                <a href="${pageContext.request.contextPath}/matchboard/listPage?category=VSTeam" class="ritekhela-banner-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ritekhela-banner-one-layer">
                <span class="ritekhela-banner-transparent"></span>
                <img src="/resources/bootstrap/extra-images/example2.jpg" alt="">
                <div class="ritekhela-banner-caption">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1> <strong class="ritekhela-color">팀</strong> 을 만들고 싶으십니까?</h1>
                                <div class="clearfix"></div>
                                <p>팀 페이지의 팀 생성을 통해 각자의 색깔을 담은 팀을 생성 하여 보세요!</p>
                                <div class="clearfix"></div>
                                <a href="${pageContext.request.contextPath}/team/maketeam" class="ritekhela-banner-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--// Banner //-->

        <!--// Content //-->
        <div class="ritekhela-main-content">

            <!--// Main Section //-->
            <div class="ritekhela-main-section ritekhela-fixture-slider-full">
                <div class="container">
                    <div class="row">

                        <!-- <div class="col-md-12">  쓰지 않는 배너
                            
                            // Fixture Slider //
                            <div class="ritekhela-fixture-slider">
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ritekhela-fixture-slider-layer">
                                    <div class="ritekhela-fixture-box">
                                        <span class="layer-shape"></span>
                                        <time datetime="2008-02-14 20:00">August 25, 2016</time>
                                        <ul>
                                            <li>BRC <span>05</span></li>
                                            <li>RM <span>02</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            // Fixture Slider //

                        </div> -->
                        
                        <!--// Left Section //-->
                        <div class="col-md-8">

                            <!--// Fancy Title Two //-->
                            <div class="ritekhela-fancy-title-two">
                                <h2>싸칭 소식</h2>
                            </div>
                            <!--// Fancy Title Two //-->

                            <!--// Latest Blog's //-->
                            <div class="ritekhela-blogs ritekhela-blog-view1">
                                <ul class="row">
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="/resources/bootstrap/extra-images/blog-view1-1.jpg" alt=""> <i class="fa fa-link"></i> </a></figure>
                                        <div class="ritekhela-blog-view1-text">
                                            <ul class="ritekhela-blog-options">
                                                <li><i class="far fa-calendar-alt"></i> January 3, 2019</li>
                                                <li><a href="#"><i class="far fa-comment"></i> Comments</a></li>
                                            </ul>
                                            <h2><a href="#">싸칭어플 사용법에대해 알고싶다면 클릭!</a></h2>
                                            <p>싸칭 어플은 축구를 좋아하며 사랑하는 사람들을 위한 축구 매칭 어플입니다! 주변 혹은 다른 팀들을 모집하고 팀원을 모아 경기를 뛰어 보세요!</p>
                                            <a href="#" class="ritekhela-blog-view1-btn">Read More</a>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="/resources/bootstrap/extra-images/blog-view1-2.jpg" alt=""> <i class="fa fa-link"></i> </a></figure>
                                        <div class="ritekhela-blog-view1-text">
                                            <ul class="ritekhela-blog-options">
                                                <li><i class="far fa-calendar-alt"></i> January 3, 2019</li>
                                                <li><a href="#"><i class="far fa-comment"></i> Comments</a></li>
                                            </ul>
                                            <h2><a href="#">축구 기본기 트레이닝</a></h2>
                                            <p>축구를 좋아하지만 몸이 따라주지 않는 당신을 위해 준비했습니다! 이 방식을 따라하며 기본을 익혀봅시다!</p>
                                            <a href="#" class="ritekhela-blog-view1-btn">Read More</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- <div class="ritekhela-blogs ritekhela-blog-view2">
                                <ul class="row">
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-1.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">Ipsum cursus leo vel metus</a></h2>
                                            <time datetime="2008-02-14 20:00">July 01, 2019 5:50 am</time>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-2.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">TV host’s hand impaled</a></h2>
                                            <time datetime="2008-02-14 20:00">June 01, 2019 6:20 am</time>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-3.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">One more time? Federer</a></h2>
                                            <time datetime="2008-02-14 20:00">March 01, 2019 2:40 am</time>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-4.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">Federer golden opportunity</a></h2>
                                            <time datetime="2008-02-14 20:00">April 01, 2019 1:80 am</time>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-5.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">Ipsum cursus leo vel metus</a></h2>
                                            <time datetime="2008-02-14 20:00">May 01, 2019 9:50 am</time>
                                        </div>
                                    </li>
                                    <li class="col-md-6">
                                        <figure><a href="#"><img src="extra-images/blog-view2-6.jpg" alt=""></a></figure>
                                        <div class="ritekhela-blog-view2-text">
                                            <h2><a href="#">TV host’s hand impaled</a></h2>
                                            <time datetime="2008-02-14 20:00">Jan 01, 2019 3:10 am</time>
                                        </div>
                                    </li>
                                </ul>
                            </div> -->
                            <!--// Latest Blog's //-->

                            <!--// Fancy Title Two //-->
                            <div class="ritekhela-fancy-title-two">
                                <h2>최고 BPM 선수</h2>
                            </div>
                            <!--// Fancy Title Two //-->

                            <!--// Player //-->
                            <div class="ritekhela-team ritekhela-team-view1">
                                <ul class="row">
                                    <li class="col-md-4">
                                        <figure>
                                            <a href="#"><img src="/resources/bootstrap/extra-images/team-view1-1.jpg" alt=""></a>
                                            <figcaption>
                                                <a href="#" class="fab fa-facebook-f"></a>
                                                <a href="#" class="fab fa-twitter"></a>
                                                <a href="#" class="fab fa-instagram"></a>
                                                <a href="#" class="fab fa-dribbble"></a>
                                            </figcaption>
                                        </figure>
                                        <div class="ritekhela-team-view1-text">
                                            <h2><a href="#">Jecy Deoko</a></h2>
                                            <span>Forword</span>
                                            <p>Lorem ipsum dolor sit met, con etur adipiscing elit. Ut c males ante.</p>
                                            <a href="#" class="ritekhela-team-view1-btn">Read More <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a href="#"><img src="/resources/bootstrap/extra-images/team-view1-2.jpg" alt=""></a>
                                            <figcaption>
                                                <a href="#" class="fab fa-facebook-f"></a>
                                                <a href="#" class="fab fa-twitter"></a>
                                                <a href="#" class="fab fa-instagram"></a>
                                                <a href="#" class="fab fa-dribbble"></a>
                                            </figcaption>
                                        </figure>
                                        <div class="ritekhela-team-view1-text">
                                            <h2><a href="#">John Smith</a></h2>
                                            <span>Defensive</span>
                                            <p>Lorem ipsum dolor sit met, con etur adipiscing elit. Ut c males ante.</p>
                                            <a href="#" class="ritekhela-team-view1-btn">Read More <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a href="#"><img src="/resources/bootstrap/extra-images/team-view1-3.jpg" alt=""></a>
                                            <figcaption>
                                                <a href="#" class="fab fa-facebook-f"></a>
                                                <a href="#" class="fab fa-twitter"></a>
                                                <a href="#" class="fab fa-instagram"></a>
                                                <a href="#" class="fab fa-dribbble"></a>
                                            </figcaption>
                                        </figure>
                                        <div class="ritekhela-team-view1-text">
                                            <h2><a href="#">Jessica</a></h2>
                                            <span>Attacker</span>
                                            <p>Lorem ipsum dolor sit met, con etur adipiscing elit. Ut c males ante.</p>
                                            <a href="#" class="ritekhela-team-view1-btn">Read More <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!--// Player //-->

                            <!--// Match Result //-->
                          <%--   <div class="ritekhela-match-result">
                                <div class="ritekhela-match-title">
                                    <h4>최근 매치 결과</h4>
                                    <span>Saturday, March 24th, 2016</span>
                                </div>
                                <ul>
                                    <li>
                                        <img src="/resources/bootstrap/extra-images/latest-result-logo-1.png" alt="">
                                        <h4><a href="#">Yorkshire</a></h4>
                                        <span>03 Mark Baily (21)</span>
                                    </li>
                                    <li class="ritekhela-match-score">
                                        <h5>FINAL SCORE</h5>
                                        <p><strong>79</strong> <small>:</small> 73</p>
                                    </li>
                                    <li>
                                        <img src="/resources/bootstrap/extra-images/latest-result-logo-2.png" alt="">
                                        <h4><a href="#">Sharks Club</a></h4>
                                        <span>03 Mark Baily (21)</span>
                                    </li>
                                </ul>
                            </div> --%>
                            <!--// Match Result //-->

                            <!--// Fancy Title Two //-->
                           <!--  <div class="ritekhela-fancy-title-two">
                                <h2>팀별 소식</h2>
                            </div> -->
                            <!--// Fancy Title Two //-->

                            <!--// Gallery //-->
                            <div class="ritekhela-gallery ritekhela-gallery-view1">
                                <%-- <ul class="row">
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-1.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-1.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">11 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>The Champion Final will be played</h2>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-2.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-2.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">06 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>will be played The Champion Final</h2>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-3.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-3.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">14 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>Champion Final The will be played</h2>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-4.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-4.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">12 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>will be The Chamn Final played</h2>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-5.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-5.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">25 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>be played The Champion Final will</h2>
                                    </li>
                                    <li class="col-md-4">
                                        <figure>
                                            <a data-fancybox-group="group" href="/resources/bootstrap/extra-images/gallery-view1-6.jpg" class="fancybox"><img src="/resources/bootstrap/extra-images/gallery-view1-6.jpg" alt=""> <i class="fa fa-plus ritekhela-bgcolor"></i> </a>
                                            <figcaption>
                                                <span class="ritekhela-bgcolor-two">04 Photos</span>
                                            </figcaption>
                                        </figure>
                                        <h2>played The Chaion Final will be</h2>
                                    </li>
                                </ul> --%>
                            </div>
                            <!--// Gallery //-->

                        </div>
                        <!--// Left Section //-->
                        
                        <!--// SideBaar //-->
                        <aside class="col-md-4">
                            
                            <!--// Widget Popular News //-->
                            <div class="widget widget_popular_news">
                                <div class="ritekhela-fancy-title-two">
                                    <h2>인기있는 소식</h2>
                                </div>
                                <ul>
                                    <li>
                                        <span>01</span>
                                        <div class="popular_news_text">
                                            <small>The Team</small>
                                            <a href="#">Basketball Stadium will a max capacity</a>
                                            <time datetime="2008-02-14 20:00">December 21, 2017</time>
                                        </div>
                                    </li>
                                    <li class="widget-injuries">
                                        <span>02</span>
                                        <div class="popular_news_text">
                                            <small>Injuries</small>
                                            <a href="#">The Clovers defense must reinvent itself without</a>
                                            <time datetime="2008-02-14 20:00">December 21, 2017</time>
                                        </div>
                                    </li>
                                    <li class="widget-theleague">
                                        <span>03</span>
                                        <div class="popular_news_text">
                                            <small>The League</small>
                                            <a href="#">Take look to the brand new helmets season</a>
                                            <time datetime="2008-02-14 20:00">December 21, 2017</time>
                                        </div>
                                    </li>
                                    <li>
                                        <span>04</span>
                                        <div class="popular_news_text">
                                            <small>The Team</small>
                                            <a href="#">The Basketball women division started training</a>
                                            <time datetime="2008-02-14 20:00">December 21, 2017</time>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!--// Widget Popular News //-->

                            <!--// Widget Team Ranking //-->
                            <div class="widget widget_team_ranking">
                                <div class="ritekhela-fancy-title-two">
                                    <h2>팀별 BPM 순위</h2>
                                </div>
                                <div class="ranking-title-table">
                                    <ul class="ranking-title-row">
                                        <li>팀순위</li>
                                        <li>팀명</li>
                                        <li>BPM</li>
                                        <li>팀원수</li>
                                        <li>창립일</li>
                                    </ul>
                                </div>
                                <div class="ranking-content-table">
                                    <ul class="ranking-content-row">
                                        <li>1</li>
                                        <li> <img src="/resources/bootstrap/extra-images/ranking-widget-flag-1.png" alt=""> <div class="ranking-logo"><span>FC서울</span> <small>Bebop Institute</small> </div> </li>
                                        <li>08</li>
                                        <li>08</li>
                                        <li>16</li>
                                    </ul>
                                </div>
                                <div class="ranking-content-table">
                                    <ul class="ranking-content-row">
                                        <li>2</li>
                                        <li> <img src="/resources/bootstrap/extra-images/ranking-widget-flag-2.png" alt=""> <div class="ranking-logo"><span>Ocean Kings</span> <small>Icarus College</small> </div> </li>
                                        <li>08</li>
                                        <li>07</li>
                                        <li>14</li>
                                    </ul>
                                </div>
                                <div class="ranking-content-table">
                                    <ul class="ranking-content-row">
                                        <li>3</li>
                                        <li> <img src="/resources/bootstrap/extra-images/ranking-widget-flag-3.png" alt=""> <div class="ranking-logo"><span>Red Wings</span> <small>Marine College</small> </div> </li>
                                        <li>07</li>
                                        <li>07</li>
                                        <li>14</li>
                                    </ul>
                                </div>
                                <div class="ranking-content-table">
                                    <ul class="ranking-content-row">
                                        <li>2</li>
                                        <li> <img src="/resources/bootstrap/extra-images/ranking-widget-flag-2.png" alt=""> <div class="ranking-logo"><span>Ocean Kings</span> <small>Icarus College</small> </div> </li>
                                        <li>08</li>
                                        <li>07</li>
                                        <li>14</li>
                                    </ul>
                                </div>
                                <div class="ranking-content-table">
                                    <ul class="ranking-content-row">
                                        <li>1</li>
                                        <li> <img src="/resources/bootstrap/extra-images/ranking-widget-flag-1.png" alt=""> <div class="ranking-logo"><span>L.A Pirates</span> <small>Bebop Institute</small> </div> </li>
                                        <li>08</li>
                                        <li>08</li>
                                        <li>16</li>
                                    </ul>
                                </div>
                            </div>
                            <!--// Widget Team Ranking //-->

                            <!--// Widget Social Media //-->
                            <div class="widget widget_social_media">
                                <div class="ritekhela-fancy-title-two">
                                    <h2>싸칭 SNS</h2>
                                </div>
                                <ul>
                                    <li>
                                        <a href="#" class="rss">
                                            <i class="fa fa-rss"></i>
                                            <span>2,035</span>
                                            <small>Subscribers</small>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="fb">
                                            <i class="fab fa-facebook-f"></i>
                                            <span>3,794</span>
                                            <small>Fans</small>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="g_plus">
                                            <i class="fab fa-google-plus-g"></i>
                                            <span>941</span>
                                            <small>Followers</small>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="you_tube">
                                            <i class="fab fa-youtube"></i>
                                            <span>7,820</span>
                                            <small>Subscribers</small>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="twitter">
                                            <i class="fab fa-twitter"></i>
                                            <span>1,562</span>
                                            <small>Followers</small>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="pint">
                                            <i class="fab fa-pinterest-p"></i>
                                            <span>1,310</span>
                                            <small>Followers</small>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!--// Widget Social Media //-->

                            <!--// Widget Next Match //-->
                           <%--  <div class="widget widget_next_match">
                                <div class="ritekhela-fancy-title-two">
                                    <h2>이달의 주요 매치</h2>
                                </div>
                                <div class="widget_next_match_title">
                                    <h5>Championship Quarter Finals</h5>
                                    <span>Saturday, May 17th, 2017</span>
                                </div>
                                <ul>
                                    <li>
                                        <img src="/resources/bootstrap/extra-images/widget-next-match-logo-1.png" alt="">
                                        <h6><a href="fixture-detail.html">Basketball</a></h6>
                                        <small>Sports And Magazine</small>
                                    </li>
                                    <li>
                                        <div class="widget_next_match_option">
                                            <h6>09:00 pm</h6>
                                            <small>Madison Stadium</small>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="/resources/bootstrap/extra-images/widget-next-match-logo-2.png" alt="">
                                        <h6><a href="fixture-detail.html">Combine</a></h6>
                                        <small>ST Paddy's Institute</small>
                                    </li>
                                </ul> --%>
                               <!--  <div class="widget_match_countdown">
                                    <h6>매칭까지 남은시간</h6>
                                    <div id="ritekhela-match-countdown"></div>
                                </div>
                                <a href="#" class="widget_match_btn">Buy Ticket Now</a>
                            </div> -->
                            <!--// Widget Next Match //-->

                            <!--// Widget Newsletter //-->
                            <!-- <div class="widget widget_newsletter"> 구독 버튼
                                <div class="ritekhela-fancy-title-two">
                                    <h2>Our Newsletter</h2>
                                </div>
                                <form>
                                    <label>Subscribe Now</label>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac malesuada ante.</p>
                                    <input type="text" value="Your Name" onblur="if(this.value == '') { this.value ='Your Name'; }" onfocus="if(this.value =='Your Name') { this.value = ''; }">
                                    <input type="text" value="Enter Your email" onblur="if(this.value == '') { this.value ='Enter Your email'; }" onfocus="if(this.value =='Enter Your email') { this.value = ''; }">
                                    <input type="submit" value="Subscribe Now">
                                </form>
                            </div> -->
                            <!--// Widget Newsletter //-->

                            <!--// Widget Add's //-->
                            <%-- <div class="widget widget_add">
                                <img src="/resources/bootstrap/extra-images/add.jpg" alt="">
                            </div> --%>
                            <!--// Widget Add's //-->

                        </aside>
                        <!--// SideBaar //-->

                    </div>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        <!--// Content //-->

        
        

<%@ include file ="../include/footer.jspf"%>