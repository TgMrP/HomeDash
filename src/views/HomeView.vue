<script setup>
import { ref, onMounted } from "vue";

const data = ref(null);
const loading = ref(true);
const error = ref(null);

async function fetchData() {
  loading.value = true;
  const response = await fetch("/database/test.json");
  // waits until the request completes...
  console.log(response);
}

onMounted(() => {
  fetchData();
});
</script>

<template>
  <main>
    <ul v-if="!loading">
      {{
        data
      }}
    </ul>

    <p v-if="loading">Still loading..</p>
    <p v-if="error"></p>
  </main>
</template>
