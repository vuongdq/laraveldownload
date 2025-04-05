<template>
    <div class="min-h-screen bg-gray-100">
        <nav class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex">
                        <div class="flex-shrink-0 flex items-center">
                            <router-link to="/" class="text-xl font-bold text-gray-800">Download Site</router-link>
                        </div>
                    </div>
                    <div class="flex items-center">
                        <template v-if="!isAuthenticated">
                            <router-link to="/login" class="text-gray-600 hover:text-gray-900 px-3 py-2 rounded-md text-sm font-medium">Login</router-link>
                            <router-link to="/register" class="ml-4 bg-blue-500 text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-blue-600">Register</router-link>
                        </template>
                        <template v-else>
                            <router-link to="/admin" class="text-gray-600 hover:text-gray-900 px-3 py-2 rounded-md text-sm font-medium">Admin</router-link>
                            <button @click="logout" class="ml-4 bg-red-500 text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-red-600">Logout</button>
                        </template>
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <router-view></router-view>
        </main>
    </div>
</template>

<script>
export default {
    data() {
        return {
            isAuthenticated: false
        }
    },
    methods: {
        async logout() {
            try {
                await axios.post('/logout');
                this.isAuthenticated = false;
                this.$router.push('/login');
            } catch (error) {
                console.error('Logout failed:', error);
            }
        }
    },
    async created() {
        try {
            const response = await axios.get('/api/user');
            this.isAuthenticated = true;
        } catch (error) {
            this.isAuthenticated = false;
        }
    }
}
</script> 