/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    // Menu Toggle Script
    $("#menu-toggle-2").click(function(e) {
       e.preventDefault();
       $("#wrapper").toggleClass("toggled");
       $('#menu ul').hide();
    });
    
    $("#menu-toggle-2").click(function(e) {
       e.preventDefault();
       $("#wrapper").toggleClass("toggled-2");
       $('#menu ul').hide();
    });

    $(document).ready(function() {initMenu();});
