<html>
    <body>
        <form id="name_form">
            <label>First Name:</label><input type="text" name="first_name"/>
            <br/>
            <label>Last Name:</label><input type="text" name="last_name"/>
            <br/>
            <input type="submit" value="submit" />
        </form>
        
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script type="text/javascript">
            $('#name_form').submit(function(e) {
                    e.preventDefault();

                    var data = {};
                    var Form = this;

                    $.each(this.elements, function(i, v) {
                        var input = $(v);
                        data[input.attr("name")] = input.val();
                        delete data["undefined"];
                    });

                    $.ajax({
                        type: 'POST',
                        url: '/api/say_name',
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify(data),
                        context: Form,
                        success: function(callback) {
                            console.log(callback);
                            // Watch out for Cross Site Scripting security issues when setting dynamic content!
                            $(this).text('Hello ' + callback.first_name + ' ' + callback.last_name  + '!');
                        },
                        error: function() {
                            $(this).html("error!");
                        }
                    });
                });
        </script>
    </body>
</html>


