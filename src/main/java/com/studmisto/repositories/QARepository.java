package com.studmisto.repositories;

import com.studmisto.entities.QAItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QARepository extends JpaRepository<QAItem, Long> {
}
