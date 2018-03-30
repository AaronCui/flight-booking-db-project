<template>
    <section class="reservations-view">
        <div class="content">
            <div class="subsection">
                <div>
                    <span class="subsection-title" style="vertical-align: middle;">Reservations</span>
                </div>
                <ul style="list-style-type: none; padding: 0; margin: 0;">
                    <li v-for="(reservation, index) in reservations" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
                        <div>Reservation # {{ reservation.reservation_id }}</div>
                        <div>
                            <ul>
                                <li>
                                    <span style="color:blue;">Flight: {{ reservation.airline }} {{ reservation.flight_no}} </span>
                                    <span style="color:blue;"> on  Date: {{ reservation.date }}</span>
                                </li>
                                <li>
                                    <span style="color:blue;">Seat No: {{ reservation.seat_no }}</span>
                                </li>
                                <li>
                                    <span style="color:green;">Route: {{ reservation.takesoff_airport }} --> {{ reservation.landsat_airport}}</span>
                                </li>
                            </ul>
                            <button type="button" style="margin-left: 20px; padding: 10px 20px; text-decoration: none;" @click="deleteReservation(reservation.reservation_id, reservation.email)">
                                Cancel Reservation
                            </button>
                        </div>
                    </li>
                </ul>
                <div>
                    <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px; margin-bottom: 30px;' :to="{ path: `/users/${email}`, params: { email: email }}">Back To Main Page</nuxt-link>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    asyncData ({ params, error }) {
      return axios.get('/api/reservations/' + params.email)
        .then((result) => {
          return {
            email: params.email,
            reservations: result.data
          }
        })
        .catch((e) => {
          alert('No reservations to show.')
          self.$nuxt.$router.replace({ path: `/users/${params.email}` })
          return {
            email: params.email,
            reservations: {}
          }
        })
    },

    methods: {
      deleteReservation (reservationID, email) {
        email = email.trim()
        axios.get(`/api/reservations/cancel/` + reservationID, {
          headers: {
            'Content-Type': 'application/json'
          },
          params: {
            reservation_id: reservationID
          }
        })
          .then((result) => {
            alert('Reservation' + reservationID + 'deleted.')
            console.log(result)
            self.$nuxt.$router.replace({ path: `/users/${email}` })
          })
          .catch((e) => {
            alert(e.response)
          })
      }
    },

    head () {
      return {
        title: 'Manage Reservations'
      }
    }
  }
</script>

<style scoped>

</style>
