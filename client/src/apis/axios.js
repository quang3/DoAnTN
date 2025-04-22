import axios from "axios";

const instance = axios.create({
    baseURL: process.env.VUE_APP_BACKEND
});

instance.interceptors.request.use((config) => {
    const user = JSON.parse(localStorage.getItem('user'));
    const token = user?.token;
    if (token) {
        config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
});

export default instance;