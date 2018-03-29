<template>
    <section class='confirm-booking'>
        <div class='content'>
            <div class='subsection'>
                <div style='margin: 25px 10px;'>
                    <span class='subsection-title' style='vertical-align: middle;'>Your reservations are as following</span>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='confirm-email'>Your email is : {{user.email}}</span>
                </div>
                <br>
                <button v-if="user.access_level === 0" type='button' class='button--grey' style='margin-left: 15px;' @click='check()'>Check and manage reservations</button>
                <div v-if="user.access_level > 0">
                    <span>Enter a Customer's email to check his/her reservations: </span>
                    <input type='text' v-model='customer_email'/>
                </div>
            </div>
            <div style='margin: 8px 0;'>
                <table id='flight-results'>
                    <thead>
                    <tr>
                        <th v-for='col in columns'>{{col}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for='(row, index) in rows'>
                        <td v-for='col in columns'>{{row[col]}}</td>
                        <br>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div>
                <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${user.email}/search`, params: { email: user.email }}">Back To Flight Search</nuxt-link>
                <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${user.email}`, params: { email: user.email }}">Back To Main Page</nuxt-link>
            </div>
        </div>
    </section>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    asyncData ({ params, error }) {
      return axios.get('/api/users/' + params.email)
        .then((res) => {
          return { user: res.data }
        })
    },
    data () {
      return {
        customer_email: '',
        rows: [],
        columns: []
      }
    },

    methods: {
      check () {
        console.log('here testsing method ')
        axios.get(`/api/reservations/` + this.user.email, {
          headers: {
            'Content-Type': 'application/json'
          },
          params: {
            email: this.user.email
          }
        })
          .then((res) => {
            if (res.data.length === 0) {
              alert('No results found!')
            }
            self.rows = res.data
            self.columns = Object.keys(self.rows[0])
            console.log('data on front end is ' + Object.keys(self.rows[0])[0])
          })
          .catch((e) => {
            alert(e.response.data)
          })
      }
    },

    head () {
      return {
        title: 'Booking confirmation'
      }
    }
  }
</script>

<style scoped>

</style>