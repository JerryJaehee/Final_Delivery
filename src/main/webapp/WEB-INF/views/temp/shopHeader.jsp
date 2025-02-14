<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <div class="col-auto col-md-4 px-0 bg-dark" style="width:170px;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">점포 관리</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                     <li>
                        <a href="#submenu1"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">storefront</span><span class="ms-1 d-none d-sm-inline">가게</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">

                            <li>
                                <a href="../shop/shopSystem" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;가게관리</span></a>
                            </li>
                             <li>
                                <a href="../shop/shopStop"" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;영업임시중지</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu2"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">assignment</span><span class="ms-1 d-none d-sm-inline">메뉴</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="../shop/shopMenu" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;메뉴관리</span></a>
                            </li>
                        </ul>
                    </li>
                   	
                   	<li>
                        <a href="#submenu3"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">request_quote</span><span class="ms-1 d-none d-sm-inline">주문정산</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="./shopOrderList" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;주문내역</span></a>
                            </li>
                            <li>
                                <a href="./settlement" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;정산내역</span></a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#" class="nav-link px-0 align-middle title">
                        <span class="material-symbols-outlined">monitoring</span><span class="ms-1 d-none d-sm-inline">통계</span></a>
                    </li>
                    
                    
                  
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://www.mcdonalds.co.kr/kor/images/common/logo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">${member.id}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="/">브랜드 홈</a></li>
                        <li><a class="dropdown-item" href="/member/mypage">마이페이지</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/member/logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
