package uk.ac.bbsrc.tgac.miso.core.service;

import java.io.IOException;
import java.util.Collection;

import org.springframework.web.multipart.MultipartFile;

import uk.ac.bbsrc.tgac.miso.core.data.Attachable;
import uk.ac.bbsrc.tgac.miso.core.data.impl.AttachmentCategory;
import uk.ac.bbsrc.tgac.miso.core.data.impl.FileAttachment;

public interface FileAttachmentService {

  public Attachable get(String entityType, long entityId) throws IOException;

  public void add(Attachable object, MultipartFile file, AttachmentCategory category) throws IOException;

  public void addShared(Collection<Attachable> objects, MultipartFile file, AttachmentCategory category) throws IOException;

  public void addLink(Attachable object, FileAttachment attachment) throws IOException;

  public void addLinks(Collection<Attachable> objects, FileAttachment attachment) throws IOException;

  public void delete(Attachable object, FileAttachment attachment) throws IOException;

  /**
   * Removes attachments from an object being deleted. Should be called before deleting any Attachable object
   * 
   * @param object an Attachable object that was just deleted
   */
  public void beforeDelete(Attachable object) throws IOException;

  /**
   * Deletes the attachments directory for a deleted object. Should be called after deleting any Attachable object
   * 
   * @param object an Attachable object that was just deleted
   */
  public void afterDelete(Attachable object) throws IOException;

}
