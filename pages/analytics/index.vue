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
                <th v-for='col in columns'>{{col}}</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for='(row, index) in rows'>
                <td >{{ row.phone_no }}</td>
                <br>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      rows: [],
      columns: [],
      promo_id: '',
      promo_item: ''
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
          self.rows = res.data
          self.columns = ['Phone no.']
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