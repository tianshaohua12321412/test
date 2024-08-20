from flask import Flask, jsonify
import random

app = Flask(__name__)

@app.route('/api/simulate', methods=['GET'])
def simulate():
    # 随机选择是否掉线
    if random.choice([True, False]):  # 50% 概率掉线
        return jsonify({'message': 'Service is down', 'status': 'error'}), 503  # 返回503状态码
    else:
        return jsonify({'message': 'Service is up', 'status': 'success'}), 200  # 返回成功状态码

if __name__ == '__main__':
    app.run(debug=True)
