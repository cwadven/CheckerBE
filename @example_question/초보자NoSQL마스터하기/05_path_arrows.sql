-- NoSQL 학습 Path Arrows 생성
WITH map_id AS (
  SELECT id FROM map_map WHERE name = '초보자도 따라해서 마스터 할 수 있는 NoSQL'
)
INSERT INTO map_arrow (map_id, start_node_id, end_node_id, node_complete_rule_id, question_id, is_deleted, created_at, updated_at) VALUES
-- 기초 이론 그룹 연결
((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cap_theorem' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'data_modeling' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '데이터 모델링 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'data_modeling' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'acid_base' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'ACID/BASE 이해' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'acid_base' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'scaling_patterns' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '확장성 패턴 학습' LIMIT 1),
 null,
 false, NOW(), NOW()),

-- MongoDB 그룹 연결
((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_basics' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_crud' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'CRUD 연산 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_crud' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_aggregation' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '집계 프레임워크 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_aggregation' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_index' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '인덱스 설계 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_index' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_replication' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '복제 설정 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_replication' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_sharding' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '샤딩 구성 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

-- Redis 그룹 연결
((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'scaling_patterns' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_basics' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'Redis 기초 학습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_basics' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_datatype' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '데이터 타입 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_datatype' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_persistence' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '영속성 설정 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_persistence' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_pubsub' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'Pub/Sub 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_pubsub' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_cache' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '캐시 서버 구성' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_cache' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_cluster' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '클러스터 구성 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

-- Cassandra 그룹 연결
((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'mongo_sharding' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_basics' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'Cassandra 기초 학습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_basics' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_model' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '데이터 모델링 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_model' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_cql' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = 'CQL 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_cql' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_arch' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '아키텍처 이해' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_arch' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_consist' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '일관성 튜닝 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_consist' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_perf' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '성능 최적화 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

-- 실전/응용 그룹 연결
((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'redis_cluster' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'usecase_analysis' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '활용 사례 학습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'cassandra_perf' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'usecase_analysis' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '활용 사례 학습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'usecase_analysis' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'migration' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '마이그레이션 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'migration' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'monitoring' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '모니터링 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'monitoring' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'security' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '보안 설정 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'security' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'backup' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '백업/복구 실습' LIMIT 1),
 null,
 false, NOW(), NOW()),

((SELECT id FROM map_id),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'backup' LIMIT 1),
 (SELECT id FROM map_node WHERE map_id = (SELECT id FROM map_id) AND name = 'best_practice' LIMIT 1),
 (SELECT id FROM map_nodecompleterule WHERE map_id = (SELECT id FROM map_id) AND name = '모범 사례 학습' LIMIT 1),
 null,
 false, NOW(), NOW()); 