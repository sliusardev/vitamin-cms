jQuery(function() {

    jQuery(document).on("click", ".mobile_menu_container .back", function(e) {
        e.preventDefault();
        jQuery(".mobile_menu_container .activity").removeClass("activity");
        jQuery(this).parent().parent().removeClass("loaded");
        jQuery(this).parent().parent().parent().parent().addClass("activity");
    });
    jQuery(document).on("click", ".mobile_menu", function(e) {
        e.preventDefault();
        jQuery(".mobile_menu_container").addClass("loaded");
        jQuery(".mobile_menu_overlay").fadeIn();
    });
    jQuery(document).on("click", ".mobile_menu_overlay", function(e) {
        jQuery(".mobile_menu_container").removeClass("loaded");
        jQuery(this).fadeOut(function() {
            jQuery(".mobile_menu_container .loaded").removeClass("loaded");
            jQuery(".mobile_menu_container .activity").removeClass("activity");
        });
    });


});

document.addEventListener("DOMContentLoaded", function() {
    const submenuToggle = document.querySelector('.toggle-submenu');
    if (submenuToggle) {
        submenuToggle.addEventListener('click', function(event) {
            event.preventDefault();
            const submenu = this.nextElementSibling;
            const arrow = this.querySelector('.arrow');
            if (submenu) {
                submenu.classList.toggle('sub-menu-active');
                arrow.classList.toggle('arrow-rotate');
            }
        });
    }
});