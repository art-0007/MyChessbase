import $ from 'jquery'
import 'select2/dist/js/select2'


// $(document).on("turbolinks:before-cache", function() {
//   $('.js-multiple-select').each(function () {
//     $(this).select2('destroy');
//   })
// })


$(document).on("turbolinks:load", function() {
  $('.js-multiple-select').each(function () {
    const $this = $(this)

    let opts = {
      theme: 'bootstrap-5',
      width: $this.data("width") ? $this.data("width") : $this.hasClass("w-100") ? "100%" : "style",
      placeholder: $this.data("placeholder"),
      allowClear: Boolean($this.data("allow-clear"))
    }

    // if($this.hasClass('js-ajax-select')) {
    //   const ajax_opts = {
    //     ajax: {
    //       url: $this.data('ajax-url'),
    //       data: function (params) {
    //         return {
    //           term: params.term
    //         }
    //       },
    //       dataType: 'json',
    //       delay: 1000,
    //       processResults: function (data, params) {
    //         const arr = $.map(data, function(value, index){
    //           return {
    //             id: value.id,
    //             text: value.title
    //           }
    //         })
    //         return {
    //           results: arr
    //         }
    //       },
    //       cache: true
    //     },
    //     minimumInputLength: 2
    //   }

    //   opts = Object.assign(opts, ajax_opts)
    // }

    $this.select2(opts)
  })
})