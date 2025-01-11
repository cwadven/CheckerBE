from datetime import datetime
from typing import List, Optional

from map.models import (
    Node,
    NodeCompleteRule,
)
from pydantic import BaseModel

from question.models import UserQuestionAnswer, UserQuestionAnswerFile


class FileDTO(BaseModel):
    id: int
    file: str


class ReviewerDTO(BaseModel):
    id: int
    nickname: str


class MyAnswerDTO(BaseModel):
    id: int
    answer: str
    is_correct: Optional[bool]
    feedback: Optional[str]
    reviewed_by: Optional[ReviewerDTO]
    reviewed_at: Optional[datetime]
    submitted_at: datetime
    files: List[FileDTO]

    @classmethod
    def from_answer(
            cls,
            user_question_answer: UserQuestionAnswer,
    ) -> 'MyAnswerDTO':
        reviewed_by = None
        if user_question_answer.reviewed_by:
            reviewed_by = ReviewerDTO(
                id=user_question_answer.reviewed_by.id,
                nickname=user_question_answer.reviewed_by.nickname,
            )

        return cls(
            id=user_question_answer.id,
            answer=user_question_answer.answer,
            is_correct=user_question_answer.is_correct,
            feedback=user_question_answer.feedback,
            reviewed_by=reviewed_by,
            reviewed_at=user_question_answer.reviewed_at,
            submitted_at=user_question_answer.created_at,
            files=[
                FileDTO(
                    id=file.id,
                    file=file.file,
                )
                for file in user_question_answer.files.filter(
                    is_deleted=False,
                )
            ],
        )


class QuestionDTO(BaseModel):
    id: Optional[int]
    arrow_id: Optional[int]
    title: str
    description: str
    status: str
    by_node_id: Optional[int]
    answer_submit_with_text: bool
    answer_submit_with_file: bool
    my_answers: List[MyAnswerDTO]


class RuleProgressDTO(BaseModel):
    completed_questions: int
    total_questions: int
    percentage: int


class NodeCompleteRuleDetailDTO(BaseModel):
    id: int
    name: str
    progress: RuleProgressDTO
    questions: List[QuestionDTO]


class NodeStatisticDTO(BaseModel):
    activated_member_count: int
    completed_member_count: int


class NodeDetailDTO(BaseModel):
    id: int
    name: str
    title: str
    description: str
    background_image: Optional[str]
    status: str
    statistic: NodeStatisticDTO
    active_rules: List[NodeCompleteRuleDetailDTO]
