-- add_targeted_resequencing_archive

ALTER TABLE TargetedResequencing ADD COLUMN archived bit(1) NOT NULL DEFAULT 0 AFTER kitDescriptorId;



