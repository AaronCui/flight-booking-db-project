<template>
    <section class="view-seats">
        <div class="content">
            <div class="subsection">
                <div style="margin: 10px;">
                    <span class="subsection-title" style="vertical-align: middle;">Available seats and information. Email is {{email}}</span>
                </div>
                <ul style="list-style-type: none; padding: 0; margin: 0;">
                    <table id='flight-results'>
                        <thead>
                        <tr>
                            <th >Seat number</th>
                            <th >Seat class</th>
                            <th >Seat price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for='seat in seats'>
                            <td >{{ seat.seat_no }}</td>
                            <td >{{ seat.seat_class }}</td>
                            <td >{{ seat.seat_price }}</td>
                            <td >
                                <nuxt-link class='button--grey' :to="{ path: `../${email}/book`,
                    query: { seat_no: seat.seat_no.trim(), flight_no: flightno, airline: airline, date: date}}">
                                    Book
                                </nuxt-link>
                            </td>
                            <br>
                        </tr>
                        </tbody>
                    </table>
                </ul>
            </div>
            <div class="subsection">
                <div style="margin: 10px 10px;">
                    <span class="subsection-title" style="vertical-align: middle;">Additional information</span>
                </div>
                <div>
                    <span class='aggregation'>Find </span>
                    <select v-model="selected">
                        <option v-for="agg in aggregators" v-bind:value="agg.value">
                            {{ agg.text }}
                        </option>
                    </select>
                    <button v-on:click="computeAggregator()">seat price:</button> {{ value }}
                </div>
            </div>
        </div>

        <div>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${email}/search`, params: { email: email }}">Back To Flight Search</nuxt-link>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${email}`, params: { email: email }}">Back To Main Page</nuxt-link>
        </div>
    </section>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    asyncData ({ params, query, error }) {
      return axios.get(`/api/search/open-seats`, {
        params: query
      })
        .then((res) => {
          return {
            seats: res.data,
            email: params.email
          }
        })
        .catch((e) => {
          error({ statusCode: 404, message: 'Unable to find open seats' })
        })
    },

    data () {
      return {
        selected: '',
        aggregators: [
          {text: 'minimum', value: 'MIN'},
          {text: 'maximum', value: 'MAX'},
          {text: 'average', value: 'AVG'}
        ],
        flightno: this.$route.query.flightno,
        airline: this.$route.query.airline,
        date: this.$route.query.date,
        value: 0
      }
    },

    methods: {
      computeAggregator () {
        let self = this

        if (this.selected === '') {
          return 0
        } else {
          return axios.get(`/api/search/aggregation`, {
            params: { flightno: self.$route.query.flightno, airline: self.$route.query.airline, date: self.$route.query.date, aggregator: self.selected }
          })
            .then((res) => {
              self.value = res.data
            })
            .catch((e) => {
              alert(e)
              self.value = 0
            })
        }
      }
    },

    head () {
      return {
        title: 'Available seats'
      }
    }
  }
</script>

<style scoped>

</style>