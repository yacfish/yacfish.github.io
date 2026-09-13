/*!
    Title: Dev Portfolio Template
    Version: 1.2.1
    Last Change: 08/27/2017
    Author: Ryan Fitzgerald
    Repo: https://github.com/RyanFitzgerald/devportfolio-template
    Issues: https://github.com/RyanFitzgerald/devportfolio-template/issues

    Description: This file contains all the scripts associated with the single-page
    portfolio website.
*/

(function($) {

    // Remove no-js class
    $('html').removeClass('no-js');

    // Animate to section when nav is clicked
    $('header a').click(function(e) {

        // Treat as normal link if no-scroll class
        if ($(this).hasClass('no-scroll')) return;

        e.preventDefault();
        var heading = $(this).attr('href');
        var scrollDistance = $(heading).offset().top;

        $('html, body').animate({
            scrollTop: scrollDistance + 'px'
        }, Math.abs(window.pageYOffset - $(heading).offset().top) / 1);

        // Hide the menu once clicked if mobile
        if ($('header').hasClass('active')) {
            $('header, body').removeClass('active');
        }
    });

    // Scroll to top
    $('#to-top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 500);
    });

    // Scroll to first element
    $('#lead-down span').click(function() {
        var scrollDistance = $('#lead').next().offset().top;
        $('html, body').animate({
            scrollTop: scrollDistance + 'px'
        }, 500);
    });

    // Create timeline
    $('#experience-timeline').each(function() {

        $this = $(this); // Store reference to this
        $userContent = $this.children('div'); // user content

        // Create each timeline block
        $userContent.each(function() {
            $(this).addClass('vtimeline-content').wrap('<div class="vtimeline-point"><div class="vtimeline-block"></div></div>');
        });

        // Add icons to each block
        $this.find('.vtimeline-point').each(function() {
            $(this).prepend('<div class="vtimeline-icon"><i class="fa fa-map-marker"></i></div>');
        });

        // Add dates to the timeline if exists
        $this.find('.vtimeline-content').each(function() {
            var date = $(this).data('date');
            if (date) { // Prepend if exists
                $(this).parent().prepend('<span class="vtimeline-date">'+date+'</span>');
            }
        });

    });

    // Open mobile menu
    $('#mobile-menu-open').click(function() {
        $('header, body').addClass('active');
    });

    // Close mobile menu
    $('#mobile-menu-close').click(function() {
        $('header, body').removeClass('active');
    });

    // Load additional projects
    $('#view-more-projects').click(function(e){
        e.preventDefault();
        $(this).fadeOut(300, function() {
            $('#more-projects').fadeIn(300);
        });
    });

})(jQuery);

var getTop = function(el) {
    return el.offsetTop + (el.offsetParent && getTop(el.offsetParent));
};

function scaleVal(value, sourceRangeMin, sourceRangeMax, targetRangeMin, targetRangeMax) {
    var targetRange = targetRangeMax - targetRangeMin;
    var sourceRange = sourceRangeMax - sourceRangeMin;
    return (value - sourceRangeMin) * targetRange / sourceRange + targetRangeMin;
}

function clamp(val, min, max) {
    return val > max ? max : val < min ? min : val;
}

window.addEventListener('resize', updateProjImgs);
window.addEventListener('scroll', updateProjImgs);

function updateProjImgs() {
    var po = parseInt(window.pageYOffset, 10);
    var ph = parseInt(window.innerHeight, 10);
    var pw = parseInt(window.innerWidth, 10);
    // Phone portrait (<=800) or phone landscape (short viewport).
    var smallflag = pw <= 800 || (ph <= 500 && pw > ph);
    var off = po + (ph - 300) / 2;
    // Desktop zoom strength unchanged (f=40). Mobile was f=120 + abssval+=3.5 (very tight crop);
    // ease phone zoom so more of each square thumb is visible in the taller 2:1 frame.
    var f = smallflag ? 70 : 40;

    if (document.getElementById('lead')) {
        var imglead = document.getElementById('lead');
        var yacoff = (Math.pow(0.002 * po, 2) * 100);
        imglead.style.backgroundPosition =
            (yacoff + 50) + '% 0px,' +
            (-yacoff + 50) + '% 108px,' +
            (yacoff + 50) + '% 216px,' +
            (-yacoff + 50) + '% 324px,' +
            (yacoff + 50) + '% 432px,' +
            (-yacoff + 50) + '% 540px,' +
            (yacoff + 50) + '% 648px,' +
            (-yacoff + 50) + '% 756px,' +
            (yacoff + 50) + '% 864px,' +
            (-yacoff + 50) + '% 972px';
    }

    var projimgs = document.getElementsByClassName('project-image');
    for (var i = 0; i < projimgs.length; i++) {
        var im = projimgs[i];
        if (!im.children || !im.children[0]) continue;
        var val = (getTop(im) - off);
        var sval = scaleVal(val, 0, 300 + (ph - 300) / 2, 0, 1);
        var powsval = Math.pow(sval, 2);
        var abssval = 1.5 - 0.6 * Math.abs(powsval);
        if (smallflag) abssval += 1.5; // was += 3.5
        im.children[0].width = 300 + (2 * f * abssval);
        im.children[0].style.marginLeft = (30 * sval + abssval * (-f)) + 'px';
        im.children[0].style.marginTop = abssval * (-f) + 'px';
    }

    if (document.getElementById('skills')) {
        var skillstop = getTop(document.getElementById('skills'));
        var skillsimgs = document.getElementsByClassName('skill_title');
        var skills_factor = 500 - ((po + (ph / 2) - skillstop) * 2 % 2500);
        for (var j = 0; j < skillsimgs.length; j++) {
            skillsimgs[j].style.setProperty('--top', skills_factor + 'px');
        }
    }

    if (document.getElementById('education')) {
        var eduhimgs = document.getElementsByClassName('education-block');
        var eduh_factor = po * 0.1;
        for (var k = 0; k < eduhimgs.length; k++) {
            eduhimgs[k].style.backgroundPosition =
                -eduh_factor + '% 0%,' + eduh_factor + '% 100%, 50% 50%';
        }

        var eduvimg = document.getElementById('education');
        var eduv_factor = po * 0.4;
        eduvimg.style.backgroundPosition =
            '0% ' + -eduv_factor + '%, 5.263158% ' + eduv_factor +
            '%, 10.526316% ' + -eduv_factor + '%, 15.789474% ' + eduv_factor +
            '%, 21.052632% ' + -eduv_factor + '%, 26.315789% ' + eduv_factor +
            '%, 31.578947% ' + -eduv_factor + '%, 36.842105% ' + eduv_factor +
            '%, 42.105263% ' + -eduv_factor + '%, 47.368421% ' + eduv_factor +
            '%, 52.631579% ' + -eduv_factor + '%, 57.894737% ' + eduv_factor +
            '%, 63.157895% ' + -eduv_factor + '%, 68.421053% ' + eduv_factor +
            '%, 73.684211% ' + -eduv_factor + '%, 78.947368% ' + eduv_factor +
            '%, 84.210526% ' + -eduv_factor + '%, 89.473684% ' + eduv_factor +
            '%, 94.736842% ' + -eduv_factor + '%, 100% ' + eduv_factor + '%';
    }
}

// Run once on load (scroll listener alone left thumbs unscaled until the user scrolled).
updateProjImgs();
