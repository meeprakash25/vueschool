<template>
  <div class="card card-box with-shadow event-card">
    <div class="card-body">
      <div class="event-info">
        <div class="event-schedule pull-left">
          <span class="day">n/a</span>
        </div>
        <p>
          <span class="event-title">{{ title }}</span>
            <span class="meta-data text-muted">
              <small class="type">n/a</small>
            </span>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String
  },
}
</script>

<style scoped lang="scss">
.card.event-card {
  opacity: 0.9;
  transition: all 0.3s ease-in-out;
  cursor: pointer;
  padding: 0;

  .event-info {
    .event-schedule {
      float: left;
      width: 100px;
      height: 100px;
      background: #e1e2e3;
      margin-right: 20px;
      text-align: center;
      padding-top: 10px;

      .day {
        display: block;
        font-size: 2rem;
        font-weight: 500;
      }

      .month {
        display: block;
        font-weight: 500;
      }
    }

    p {
      padding-top: 15px;
      margin-bottom: 0;

      span {
        display: block;

        &.event-title {
          font-size: 150%;
          font-weight: 500;
        }

        &.meta-data {
          font-size: 125%;
        }

        small + small {
          margin-left: 0.5rem;
        }
      }
    }
  }
}
</style>