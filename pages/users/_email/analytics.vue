<template>
    <section class="analytics">
        <div class="content">
            <div class="subsection">
                <div style="margin: 25px 10px;">
                    <span class="subsection-title" style="vertical-align: middle;">Analytical queries</span>
                </div>
                <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            1. Find the phone numbers of customers who have ordered all promotion items
          </span>
                    <button v-on:click="division()">Search!</button>
                </div>
                <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            Insert a new promotion ID and item and re-run
          </span>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='landsat_takesoff_flight-flightno'>Promotion ID: </span>
                    <input type='text' v-model='promo_id'></input>
                    <span class='landsat_takesoff_flight-flightno'>Promotion item: </span>
                    <input type='text' v-model='promo_item'></input>
                    <button v-on:click="insertPromoItem()">Insert!</button>
                </div>

                <div style='margin: 8px 0;'>
                    <table id='division-results'>
                        <thead>
                        <tr>
                            <th v-for='col in divide_columns'>{{col}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for='(row, index) in divide_rows'>
                            <td >{{ row.phone_no }}</td>
                            <br>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            2. Find the cheapest average price for all flights of a certain class
          </span>
                </div>
                <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            Please specify the start date, end date, source, destination, and seat class
          </span>
                </div>
                <div style='margin: 10px 0;'>
                    <span>Start date: </span>
                    <input type='text' v-model='min_max_start_date'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span>End date: </span>
                    <input type='text' v-model='min_max_end_date'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span>Source Location: </span>
                    <input type='text' v-model='source'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span>Destination: </span>
                    <input type='text' v-model='destination'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span>Seat class: </span>
                    <select v-model='seat_class'>
                        <option value='first'>First</option>
                        <option value='business'>Business</option>
                        <option value='economy'>Economy</option>
                    </select>
                </div>
                <div style='margin: 10px 0;'>
                    <span>Min or Max: </span>
                    <select v-model='min_max'>
                        <option value='max'>Max</option>
                        <option value='min'>Min</option>
                    </select>
                </div>
                <div style='margin: 10px 0;'>
                    <button v-on:click="min_max_avg()">Search!</button>
                </div>
            </div>

            <div style='margin: 8px 0;'>
                <table id='min_max_avg-results'>
                    <thead>
                    <tr>
                        <th v-for='col in min_max_avg_columns'>{{col}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for='(row, index) in min_max_avg_rows'>
                        <td >{{ row.date }}</td>
                        <td >{{ parseFloat(row.avg)/100 }}</td>
                        <br>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            3. Find the sum of counts of seats grouped by reserved status over a date range
          </span>
            </div>
            <div style="margin: 25px 10px;">
          <span class="subsection-title" style="vertical-align: middle;">
            Please specify the start date, end date
          </span>
            </div>
            <div style='margin: 10px 0;'>
                <span>Start date: </span>
                <input type='text' v-model='sum_count_start_date'/>
            </div>
            <div style='margin: 10px 0;'>
                <span>End date: </span>
                <input type='text' v-model='sum_count_end_date'/>
            </div>
            <div style='margin: 10px 0;'>
                <button v-on:click="sum_count()">Search!</button>
            </div>
        </div>

        <div style='margin: 8px 0;'>
            <table id='sum_count-results'>
                <thead>
                <tr>
                    <th v-for='col in sum_count_columns'>{{col}}</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for='(row, index) in sum_count_rows'>
                    <td >{{ Boolean(row.reserved) }}</td>
                    <td >{{ row.sum }}</td>
                    <br>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px; margin-bottom: 30px;' :to="{ path: `/users/${user.email}/search`, params: { email: user.email }}">Back To Flight Search</nuxt-link>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px; margin-bottom: 30px;' :to="{ path: `/users/${user.email}`, params: { email: user.email }}">Back To Main Page</nuxt-link>
        </div>
        <br>

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
        divide_rows: [],
        divide_columns: [],
        min_max_avg_rows: [],
        min_max_avg_columns: [],
        sum_count_rows: [],
        sum_count_columns: [],
        promo_id: '',
        promo_item: '',
        min_max_start_date: '',
        min_max_end_date: '',
        sum_count_start_date: '',
        sum_count_end_date: '',
        source: '',
        destination: '',
        seat_class: '',
        min_max: ''
      }
    },

    methods: {
      division () {
        let self = this

        axios.get('/api/analytics/divide')
          .then((res) => {
            if (res.data.length === 0) {
              alert('No results found!')
            }
            self.divide_rows = res.data
            self.divide_columns = ['Phone no.']
          })
          .catch((e) => {
            alert(e)
          })
      },

      insertPromoItem () {
        let self = this

        if (self.promo_id && self.promo_item) {
          axios.post('/api/analytics/newpromo', {
            headers: {
              'Content-Type': 'application/json'
            },
            data: {
              promotion_id: self.promo_id,
              promotion_item: self.promo_item
            }
          })
            .then((res) => {
              alert(res.data)
            })
            .catch((e) => {
              alert(e.response.data)
            })
        } else {
          alert('Error: please input both a valid promotion ID and item.')
        }
      },

      min_max_avg () {
        let self = this
        let endpoint = ''

        if (self.min_max === 'max') {
          endpoint = '/api/analytics/maxavg'
        } else if (self.min_max === 'min') {
          endpoint = '/api/analytics/minavg'
        } else {
          alert('Min or Max not specified')
          return
        }

        axios.post(endpoint, {
          headers: {
            'Content-Type': 'application/json'
          },
          data: {
            start_date: self.min_max_start_date,
            end_date: self.min_max_end_date,
            source: self.source,
            destination: self.destination,
            seat_class: self.seat_class
          }
        })
          .then((res) => {
            if (res.data.length === 0) {
              alert('No results found!')
            }
            self.min_max_avg_rows = res.data
            self.min_max_avg_columns = ['Date', 'Average Seat Price']
          })
          .catch((e) => {
            alert(e)
          })
      },

      sum_count () {
        let self = this

        axios.post('/api/analytics/sumcount', {
          headers: {
            'Content-Type': 'application/json'
          },
          data: {
            start_date: self.sum_count_start_date,
            end_date: self.sum_count_end_date
          }
        })
          .then((res) => {
            if (res.data.length === 0) {
              alert('No results found!')
            }
            self.sum_count_rows = res.data
            self.sum_count_columns = ['Reserved', 'Total']
          })
          .catch((e) => {
            alert(e)
          })
      }
    },

    head () {
      return {
        title: 'Analytics'
      }
    }
  }
</script>

<style scoped>

</style>