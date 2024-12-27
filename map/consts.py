from common.common_consts.common_enums import StrValueLabel


class NodeStatus(StrValueLabel):
    COMPLETED = ('completed', '완료')
    IN_PROGRESS = ('in_progress', '진행중')
    LOCKED = ('locked', '잠김')