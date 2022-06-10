<template>
    <div>
        <div class="page-title">
            <div class="fix-width fix-width-mobile">
                <h2>{{ page.title }}</h2>
            </div>
        </div>

        <div v-if="page.body" class="fix-width fix-width-mobile p-t-80">
            <div class="page-body" v-html="page.body"></div>
        </div>

        <div class="fix-width fix-width-mobile p-y-80">
            <div class="row">
                <div class="col-12">
                    <div class="event-feed" v-if="articles.total">
                        <div  v-for="article in articles.data" @click.prevent="showArticle(article)">
                            <article-notice-card class="event-item" :article="article"></article-notice-card>
                        </div>
                    </div>
                  <empty-card v-else class="event-item" :title="'No Notices'"></empty-card>
                  <pagination-record :page-length.sync="filter.page_length" :records="articles" @updateRecords="getArticles"></pagination-record>
                </div>
            </div>
        </div>
      <article-detail v-if="showArticleModal" @close="showArticleModal = false" :uuid="showArticleUuid" :url="`/frontend/article/${showArticleUuid}/detail`"></article-detail>
    </div>
</template>

<script>
    import ArticleDetail from '@views/post/article/show'
    import ArticleNoticeCard from '@js/widgets/article-notice-card'
    import EmptyCard from '@js/widgets/empty-card'

    export default {
      components: {
        EmptyCard,
        ArticleDetail,
        ArticleNoticeCard
      },
      data(){
        return {
          page: {},
          articles: {
            total: 0,
            data: []
          },
          filter: {
            sort_by : 'date_of_article',
            order: 'desc',
            keyword: '',
            article_type_id: [1],
            date_of_article_start_date: '',
            date_of_article_end_date: '',
            page_length: helper.getConfig('page_length')
          },
          orderByOptions: [
            {
              value: 'date_of_article',
              translation: i18n.post.date_of_article
            },
            {
              value: 'title',
              translation: i18n.post.article_title
            }
          ],
          article_types: [],
          selected_article_types: null,
          showArticleModal: false
        }
      },
      mounted(){
        this.getData();
        this.getArticles();

        helper.showDemoNotification(['frontend_article']);
      },
      methods: {
        getData(){
          let loader = this.$loading.show();
          axios.get('/api/frontend/page/notices/content')
              .then(response => {
                this.page = response.page;
                loader.hide();
              })
              .catch(error => {
                loader.hide();
                helper.showErrorMsg(error);

                if (error.response.status == 422)
                  this.$router.push('/');
              })
        },
        getArticles(page){
          let loader = this.$loading.show();
          if (typeof page !== 'number') {
            page = 1;
          }
          this.filter.date_of_article_start_date = helper.toDate(this.filter.date_of_article_start_date);
          this.filter.date_of_article_end_date = helper.toDate(this.filter.date_of_article_end_date);
          let url = helper.getFilterURL(this.filter);
          // console.log(url)
          axios.get('/api/frontend/article/list?page=' + page + url)
              .then(response => {
                this.articles = response.articles;
                this.article_types = response.article_types;
                // console.log( this.articles);
                loader.hide();
              })
              .catch(error => {
                loader.hide();
                helper.showErrorMsg(error);
              });
        },
        getConfig(config) {
          return helper.getConfig(config)
        },
        showArticle(article) {
          this.showArticleUuid = article.uuid;
          this.showArticleModal = true;
        },
      },
      filters: {
        moment(date) {
          return helper.formatDate(date);
        },
        momentDateTime(date) {
          return helper.formatDateTime(date);
        },
        momentTime(time) {
          return helper.formatTime(time);
        }
      },
      watch: {
        'filter.sort_by': function(val){
          this.getArticles();
        },
        'filter.order': function(val){
          this.getArticles();
        },
        'filter.page_length': function(val){
          this.getArticles();
        }
      },
    }
</script>