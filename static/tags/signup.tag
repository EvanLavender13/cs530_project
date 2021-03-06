<signup>

    <virtual if={show}>
        <div class="section">
            <div class="container">
                <div class="columns">
                    <div class="column is-half is-offset-one-quarter">
                        <form onsubmit={signup}>
                            <div class="field">
                                <label class="label is-large">Email</label>
                                <div class="control has-icons-left">
                                    <input class="input is-large" ref="email" name="email" type="email"
                                           placeholder="Email"
                                           value="">
                                    <span class="icon is-large is-left">
                            <i class="fas fa-envelope"></i>
                        </span>
                                </div>
                            </div>

                            <div class="field">
                                <label class="label is-large">Password</label>
                                <div class="control has-icons-left">
                                    <input class="input is-large" ref="password" name="password" type="password"
                                           placeholder="Password" value="">
                                    <span class="icon is-large is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                                </div>
                            </div>

                            <div class="field">
                                <div class="control">
                                    <button class="button is-link">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </virtual>

    <script>
        var self = this

        var localRoute = route.create()

        localRoute(function () {
            self.show = false
            self.update()
        })

        localRoute("/signup", function () {
            self.show = true
            self.update()
        })

        signup = function (event) {
            event.preventDefault()

            authService.register({
                email: self.refs.email.value,
                password: self.refs.password.value
            })
        }

        authService.on("login", function (success) {
            if (success) {
                route("/dash")
            }
        })

    </script>

</signup>