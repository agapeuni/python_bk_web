{% if messages %}
    <ul>
    {% for message in messages %}
        <li>{{ message }}</li>
    {% endfor %}
    </ul>
{% endif %}