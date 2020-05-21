$carousel = $(".js-carousel")
return unless $carousel.length > 0

LEFT_ARROW_IMAGE_URL = "/source/images/testimonials/left_arrow.svg"
RIGHT_ARROW_IMAGE_URL = "/source/images/testimonials/right_arrow.svg"

$(".js-carousel").slick(
  arrows: true
  prevArrow: "<button><img src='#{ LEFT_ARROW_IMAGE_URL }'></button>"
  nextArrow: "<button><img src='#{ RIGHT_ARROW_IMAGE_URL }'></button>"
)

$('.js-carousel').on 'beforeChange', (event, slick, direction) ->
  analytics.track("Changed Testimonial")
